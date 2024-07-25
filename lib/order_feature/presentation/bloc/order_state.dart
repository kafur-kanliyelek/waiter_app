part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

//Orderloaded ve orderupdated tek stte tarafından yönetilebilir mi??
//loaded firebase listesi alacak ve false olanları yazdıracak, diğeri true olanları yazdıracak.
final class OrderLoaded extends OrderState {
  final List<OrderModel> orders;

  const OrderLoaded({required this.orders});
  @override
  List<Object> get props => [orders];
}

final class OrderUpdated extends OrderState {}

final class OrderFailure extends OrderState {}
