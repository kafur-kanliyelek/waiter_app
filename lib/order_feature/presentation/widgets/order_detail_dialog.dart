import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:richie_the_waiter/core/constants.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';

class OrderDetailDialog extends StatelessWidget {
  const OrderDetailDialog({
    super.key,
    required this.ordersList,
    required this.index,
  });
  final List<OrderModel> ordersList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${ordersList[index].tableNo} ${ProjectConstants.table}'),
                Text(
                    '${ProjectConstants.currency} ${ordersList[index].totalAmount}'),
                Text(DateFormat(ProjectConstants.dateFormat)
                    .format(ordersList[index].orderTime)),
              ],
            ),
            DetailDialogInnerListview(ordersList: ordersList, index: index)
          ],
        ),
      ),
    );
  }
}

class DetailDialogInnerListview extends StatelessWidget {
  const DetailDialogInnerListview({
    super.key,
    required this.ordersList,
    required this.index,
  });

  final List<OrderModel> ordersList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ordersList[index].orders.length,
        itemBuilder: ((context, myindex) {
          return ListTile(
            title: Text(
                '${ordersList[index].orders[myindex]['quantity']} ${ProjectConstants.count} ${ordersList[index].orders[myindex]['item_name']}'),
          );
        }));
  }
}
