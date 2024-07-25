import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:richie_the_waiter/order_feature/domain/entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.orderID,
    required super.orders,
    required super.totalAmount,
    required super.orderCompleted,
    required super.orderTime,
    required super.tableNo,
    required super.orderCompletedTime,
    required super.kitchenTaskCompleted,
    super.waiter,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'orders': orders,
      'totalAmount': totalAmount,
      'orderCompleted': orderCompleted,
      'orderTime': orderTime,
      'orderCompletedTime': orderCompletedTime,
      'tableNo': tableNo,
      'kitchenTaskCompleted': kitchenTaskCompleted,
      'waiter': waiter,
    };
  }

  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return OrderModel(
        orderID: snapshot['orderID'],
        orders: (snapshot['orders']),
        totalAmount: snapshot['totalAmount'],
        orderCompleted: snapshot['orderCompleted'],
        orderTime: (snapshot['orderTime'] as Timestamp).toDate(),
        orderCompletedTime:
            (snapshot['orderCompletedTime'] ?? Timestamp.now()).toDate(),
        tableNo: snapshot['tableNo'],
        kitchenTaskCompleted: false);
  }
}

class OrderItemModel extends OrderItem {
  const OrderItemModel(
      {required super.itemName,
      required super.category,
      required super.itemPrice,
      required super.quantity});

  factory OrderItemModel.fromEntity(OrderItem orderItem) {
    return OrderItemModel(
        itemName: orderItem.itemName,
        category: orderItem.category,
        itemPrice: orderItem.itemPrice,
        quantity: orderItem.quantity);
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      itemName: json['food_name'],
      itemPrice: double.parse(json['food_price']),
      category: json['category'],
      quantity: json['quantity'] ?? 1,
    );
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
        itemName: map['item_name'],
        category: map['item_category'],
        itemPrice: map['item_price'],
        quantity: map['quantity']);
  }

  Map<String, dynamic> toMap() {
    return {
      'item_name': itemName,
      'item_category': category,
      'item_price': itemPrice,
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'item_name': itemName,
      'item_category': category,
      'item_price': itemPrice,
      'quantity': quantity,
    };
  }

  OrderItemModel copyWith(
      {String? itemName, String? category, double? itemPrice, int? quantity}) {
    return OrderItemModel(
        itemName: itemName ?? this.itemName,
        category: category ?? this.category,
        itemPrice: itemPrice ?? this.itemPrice,
        quantity: quantity ?? this.quantity);
  }
}
