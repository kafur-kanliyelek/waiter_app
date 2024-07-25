import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richie_the_waiter/core/constants.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/presentation/bloc/order_bloc.dart';
import 'package:richie_the_waiter/order_feature/presentation/widgets/order_completed_confirm_button.dart';
import 'package:richie_the_waiter/order_feature/presentation/widgets/order_detail_dialog.dart';
import 'package:richie_the_waiter/order_feature/presentation/widgets/orderdoesntexist.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProjectConstants.orderListtTitle),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OrderFailure) {
            return const Center(child: Text(ProjectConstants.beklenmedikHata));
          }
          if (state is OrderLoaded) {
            List<OrderModel> ordersList = state.orders
                .where((element) => element.orderCompleted == false)
                .toList();

            return state.orders.isEmpty
                ? const OrderDoesntExist()
                : _buildOrdersListview(state, ordersList);
          }
          return const LinearProgressIndicator();
        },
      ),
    );
  }

  ListView _buildOrdersListview(
      OrderLoaded state, List<OrderModel> ordersList) {
    return ListView.builder(
        itemCount: state.orders
            .where((element) => element.orderCompleted == false)
            .length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  _showOrderDetailDialog(context, ordersList, index);
                },
                child: Text(
                    '${ordersList[index].tableNo} ${ProjectConstants.tableOrder}')),
            trailing: OrderCompletedConfirmButton(
                ordersList: ordersList, index: index),
          );
        }));
  }

  Future<dynamic> _showOrderDetailDialog(
      BuildContext context, List<OrderModel> ordersList, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return OrderDetailDialog(ordersList: ordersList, index: index);
        });
  }
}
