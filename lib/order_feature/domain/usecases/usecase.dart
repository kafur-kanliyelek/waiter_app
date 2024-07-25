import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/domain/repository.dart';

abstract class UseCase {
  final OrderRepository orderRepository;

  UseCase({required this.orderRepository});

  call(OrderModel order);
}
