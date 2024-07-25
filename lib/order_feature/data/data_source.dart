import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:richie_the_waiter/auth_feature/data/user_datasource.dart';
import 'package:richie_the_waiter/order_feature/data/data_model.dart';

abstract class DataSource {
  readData();
  loadData();
  updateData(OrderModel order);
}

class DataSourceImpl implements DataSource {
  final orderCollection = FirebaseFirestore.instance
      .collection("orders")
      .orderBy('orderTime', descending: true);

  @override
  loadData() {}

  @override
  Stream<List<OrderModel>> readData() {
    return orderCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => OrderModel.fromSnapshot(e)).toList());
  }

  @override
  updateData(OrderModel order) {
    final newOrderData = OrderModel(
            orderID: order.orderID,
            orders: order.orders,
            orderCompleted: true,
            orderTime: order.orderTime,
            orderCompletedTime: (Timestamp.now()).toDate(),
            tableNo: order.tableNo,
            totalAmount: order.totalAmount,
            waiter: waiterName,
            kitchenTaskCompleted: order.kitchenTaskCompleted)
        .toJson();
    try {
      FirebaseFirestore.instance
          .collection("orders")
          .doc(order.orderID)
          .set(newOrderData);
      // orderCollection.doc(order.orderID).set(newOrderData);
    } catch (e) {
      ('error: $e');
    }
  }
}
