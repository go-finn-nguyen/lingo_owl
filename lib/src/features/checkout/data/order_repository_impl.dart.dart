import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/order.dart';
import 'order_reference.dart';
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final orderRef = OrderReference(FirebaseFirestore.instance);

  @override
  Future<void> createOrder(LOrder order) {
    return orderRef.set(order.id, order);
  }
}
