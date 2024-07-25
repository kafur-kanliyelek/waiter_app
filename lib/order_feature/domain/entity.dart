import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String orderID;
  final List<dynamic> orders;
  final num totalAmount;
  final bool orderCompleted;
  final bool kitchenTaskCompleted;
  final DateTime orderTime;
  final DateTime? orderCompletedTime;
  final String tableNo;
  final String? waiter;

  const OrderEntity(
      {this.waiter,
      required this.kitchenTaskCompleted,
      required this.orderCompletedTime,
      required this.orderID,
      required this.orders,
      required this.totalAmount,
      required this.orderCompleted,
      required this.orderTime,
      required this.tableNo});

  @override
  List<Object?> get props =>
      [orderID, orders, totalAmount, orderCompleted, orderTime, tableNo];
}

class OrderItem extends Equatable {
  final String itemName;
  final String category;
  final double itemPrice;
  final int quantity;

  const OrderItem(
      {required this.quantity,
      required this.category,
      required this.itemName,
      required this.itemPrice});

  Map<String, dynamic> toJson() {
    return {
      'item_name': itemName,
      'item_category': category,
      'item_price': itemPrice,
      'quantity': quantity,
    };
  }

  @override
  List<Object?> get props => [itemName, category, itemPrice, quantity];

  @override
  bool get stringify => true;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderItem &&
        itemName == other.itemName &&
        itemPrice == other.itemPrice;
  }

  @override
  int get hashCode => itemName.hashCode ^ itemPrice.hashCode;
}
