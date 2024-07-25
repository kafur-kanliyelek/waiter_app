import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/data/data_source.dart';
import 'package:richie_the_waiter/order_feature/data/repository_impl.dart';
import 'package:richie_the_waiter/order_feature/domain/usecases/readdata_usecase.dart';
import 'package:richie_the_waiter/order_feature/domain/usecases/updatedata_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  StreamSubscription<List<OrderModel>>? _ordersStreamSubscription;

  @override
  Future<void> close() async {
    await _ordersStreamSubscription!.cancel();
    return super.close();
  }

  OrderBloc() : super(OrderInitial()) {
    on<ReadDataEvent>((event, emit) {
      try {
        emit(OrderLoading());

        //final streamResponse = DataSourceImpl().readData();
        final streamResponse = ReadDataUseCase(
                orderRepository:
                    OrderRepositoryImpl(dataSource: DataSourceImpl()))
            .call();

        _ordersStreamSubscription?.cancel();
        _ordersStreamSubscription = streamResponse.listen((orders) {
          add(LoadDataEvent(orders: orders));
        });
      } catch (e) {
        emit(OrderFailure());
      }
    });
    on<LoadDataEvent>((event, emit) {
      try {
        emit(OrderLoaded(orders: event.orders));

        //emit(OrderLoaded());
      } catch (e) {
        emit(OrderFailure());
      }
    });
    on<UpdateDataEvent>((event, emit) {
      try {
        UpdateDataUseCase(
                orderRepository:
                    OrderRepositoryImpl(dataSource: DataSourceImpl()))
            .call(event.order)
            .data;

        emit(OrderUpdated());
      } catch (e) {
        OrderFailure();
      }
    });
  }
}
