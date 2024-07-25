import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/domain/usecases/usecase.dart';

class LoadDataUseCase extends UseCase {
  LoadDataUseCase({required super.orderRepository});

  @override
  call(OrderModel order) {
    return orderRepository.loadData();
  }
}
