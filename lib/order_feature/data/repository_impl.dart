import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/data/data_source.dart';
import 'package:richie_the_waiter/order_feature/domain/repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final DataSource dataSource;

  OrderRepositoryImpl({required this.dataSource});
  @override
  loadData() {
    return dataSource.loadData();
  }

  @override
  Stream<List<OrderModel>> readData() {
    return dataSource.readData();
  }

  @override
  updateData(OrderModel order) {
    return dataSource.updateData(order);
  }
}
