import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/domain/repository.dart';

class ReadDataUseCase {
  OrderRepository orderRepository;
  ReadDataUseCase({
    required this.orderRepository,
  });

  Stream<List<OrderModel>> call() {
    return orderRepository.readData();
  }
}
