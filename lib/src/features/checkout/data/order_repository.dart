import '../model/order.dart';

abstract class OrderRepository {
  Future<void> createOrder(LOrder order);
}
