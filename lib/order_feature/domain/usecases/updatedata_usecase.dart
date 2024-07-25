import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/domain/repository.dart';

class UpdateDataUseCase {
  OrderRepository orderRepository;
  UpdateDataUseCase({
    required this.orderRepository,
  });

  call(OrderModel order) {
    return orderRepository.updateData(order);
  }
}
