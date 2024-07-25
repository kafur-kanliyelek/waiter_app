import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richie_the_waiter/core/constants.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/presentation/bloc/order_bloc.dart';
import 'package:richie_the_waiter/order_feature/presentation/widgets/completed_orders_is_empty.dart';
import 'package:richie_the_waiter/order_feature/presentation/widgets/completed_orders_listview.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(ProjectConstants.orderCompletedTitle),
          automaticallyImplyLeading: false),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OrderFailure) {
            return const Text(ProjectConstants.beklenmedikHata);
          }
          if (state is OrderLoaded) {
            List<OrderModel> completedList2 = state.orders
                .where((element) => element.orderCompleted == true)
                .toList();

            return state.orders.isEmpty
                ? const CompletedOrdersIsEmpty()
                : CompletedOrdersListview(
                    completedList2: completedList2,
                    state: state,
                  );
          }
          return const Center(child: LinearProgressIndicator());
        },
      ),
    );
  }
}
