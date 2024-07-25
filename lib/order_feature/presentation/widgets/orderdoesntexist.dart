import 'package:flutter/material.dart';
import 'package:richie_the_waiter/core/constants.dart';

class OrderDoesntExist extends StatelessWidget {
  const OrderDoesntExist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(ProjectConstants.orderDoesntExist));
  }
}
