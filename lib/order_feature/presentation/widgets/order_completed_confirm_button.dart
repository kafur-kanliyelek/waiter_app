import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richie_the_waiter/core/colors.dart';
import 'package:richie_the_waiter/core/constants.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';
import 'package:richie_the_waiter/order_feature/presentation/bloc/order_bloc.dart';

class OrderCompletedConfirmButton extends StatelessWidget {
  const OrderCompletedConfirmButton({
    super.key,
    required this.ordersList,
    required this.index,
  });

  final List<OrderModel> ordersList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  content: const Text(ProjectConstants.confirmOrderCompleted),
                  actions: [
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: ForestColors.warmCognac.color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                    width: 1.5,
                                    color: ForestColors.warmCognac.color!))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(ProjectConstants.no)),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<OrderBloc>(context)
                              .add(UpdateDataEvent(order: ordersList[index]));
                          Navigator.pop(context);
                        },
                        child: const Text(ProjectConstants.yes))
                  ],
                );
              });
        },
        icon: const Icon(
          ProjectConstantsIcon.done,
          color: Colors.green,
        ));
  }
}
