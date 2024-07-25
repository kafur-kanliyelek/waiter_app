import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richie_the_waiter/auth_feature/data/user_datasource.dart';
import 'package:richie_the_waiter/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:richie_the_waiter/core/constants.dart';
import 'package:richie_the_waiter/order_feature/presentation/pages/completed_orders.dart';
import 'package:richie_the_waiter/order_feature/presentation/pages/orders_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [const OrdersPage(), const CompletedOrders()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(waiterName),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context)
                    .add(LogoutEvent(context: context));
              },
              icon: const Icon(ProjectConstantsIcon.logout))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(ProjectConstantsIcon.restaurant),
              label: 'Orders',
              backgroundColor: Color.fromRGBO(76, 175, 80, 1)),
          BottomNavigationBarItem(
              icon: Icon(ProjectConstantsIcon.addTask),
              label: 'Completed Orders')
        ],
      ),
    );
  }
}
