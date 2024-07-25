import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richie_the_waiter/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:richie_the_waiter/auth_feature/presentation/pages/sign_up_page.dart';
import 'package:richie_the_waiter/firebase_options.dart';
import 'package:richie_the_waiter/core/theme/theme.dart';
import 'package:richie_the_waiter/order_feature/presentation/bloc/order_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderBloc()..add(ReadDataEvent())),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Richie',
        theme: themeForest,
        home: const SignUpPage(),
      ),
    );
  }
}
