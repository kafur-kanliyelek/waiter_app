import 'package:richie_the_waiter/order_feature/data/data_model.dart';

abstract class OrderRepository {
  Stream<List<OrderModel>> readData();
  loadData();
  updateData(OrderModel order);
}
