import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../cart/data/remote/remote_cart_repository.dart';
import '../../cart/model/mutable_cart.dart';
import '../data/order_repository.dart';
import '../../wishlist/data/wishlist_repository.dart';
import '../../wishlist/model/mutable_wishlist.dart';

import '../../payment/application/payment_service.dart';
import '../model/order.dart';

final checkoutServiceProvider = Provider<CheckoutService>((ref) {
  final paymentService = ref.watch(paymentServiceProvider);
  final orderRepository =
      ref.watch(DomainManager.instance.orderRepositoryProvider);
  final cartRepository =
      ref.watch(DomainManager.instance.remoteCartRepositoryProvider);
  final wishlistRepository =
      ref.watch(DomainManager.instance.wishlistRepositoryProvider);

  return CheckoutService(
    paymentService,
    orderRepository,
    cartRepository,
    wishlistRepository,
  );
});

class CheckoutService {
  CheckoutService(
    this._service,
    this._orderRepository,
    this._remoteCartRepository,
    this._wishlistRepository,
  );

  final PaymentService _service;
  final OrderRepository _orderRepository;
  final RemoteCartRepository _remoteCartRepository;
  final WishlistRepository _wishlistRepository;

  Future<void> initPayment(
    LOrder order,
  ) async {
    try {
      return _service.initPayment(order);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> showPaymentSheet(LOrder order) async {
    try {
      await _service.showPaymentSheet();
      _onPaymentSuccess(order);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onPaymentSuccess(LOrder order) async {
    final uid = order.uid;
    final courseIds = order.items.map((e) => e.courseId).toList();

    _orderRepository.createOrder(order);
    _removeItemsInCartIfExist(uid, courseIds);
    _removeItemsInWishlistIfExist(uid, courseIds);
  }

  Future<void> _removeItemsInCartIfExist(
      UserId uid, List<CourseId> courseIds) async {
    final cart = await _remoteCartRepository.fetchCart(uid);
    final update = cart.removeItems(courseIds);
    _remoteCartRepository.setCart(uid, update);
  }

  Future<void> _removeItemsInWishlistIfExist(
      UserId uid, List<CourseId> courseIds) async {
    final wishlist = await _wishlistRepository.fetchWishlist(uid);
    final update = wishlist.removeItems(courseIds);
    _wishlistRepository.setWishlist(uid, update);
  }
}
