import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:richie_the_waiter/core/constants.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/presentation/bloc/order_bloc.dart';

class CompletedOrdersListview extends StatelessWidget {
  const CompletedOrdersListview({
    super.key,
    required this.completedList2,
    required this.state,
  });

  final List<OrderModel> completedList2;
  final OrderLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: false,
        itemCount: state.orders
            .where((element) => element.orderCompleted == true)
            .length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(8.0)),
            child: ListTile(
                trailing: Column(
                  children: [
                    Text(
                        '${ProjectConstants.currency} ${completedList2[index].totalAmount}'),
                    Text('${ProjectConstants.order} ${index + 1}'),
                    Text(DateFormat(ProjectConstants.dateFormat)
                        .format(completedList2[index].orderCompletedTime!)),
                  ],
                ),
                title: InnerListview(
                  completedList2: completedList2,
                  index: index,
                )),
          );
        }));
  }
}

class InnerListview extends StatelessWidget {
  const InnerListview({
    super.key,
    required this.completedList2,
    required this.index,
  });

  final List<OrderModel> completedList2;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: completedList2[index].orders.length,
        itemBuilder: ((context, myindex) {
          return ListTile(
            title: Text(
                '${completedList2[index].orders[myindex]['quantity']} ${ProjectConstants.count} ${completedList2[index].orders[myindex]['item_name']}'),
          );
        }));
  }
}
