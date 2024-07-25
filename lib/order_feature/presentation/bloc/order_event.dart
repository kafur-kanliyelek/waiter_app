part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class ReadDataEvent extends OrderEvent {}

class LoadDataEvent extends OrderEvent {
  final List<OrderModel> orders;

  const LoadDataEvent({required this.orders});
  @override
  List<Object> get props => [orders];
}

class UpdateDataEvent extends OrderEvent {
  final OrderModel order;

  const UpdateDataEvent({required this.order});
  @override
  List<Object> get props => [order];
}
