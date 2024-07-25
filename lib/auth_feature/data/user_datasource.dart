import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:richie_the_waiter/auth_feature/data/user_model.dart';
import 'package:richie_the_waiter/auth_feature/presentation/pages/login_page.dart';
import 'package:richie_the_waiter/core/colors.dart';
import 'package:richie_the_waiter/order_feature/presentation/pages/main_page.dart';

abstract class UserDataSource {
  login({required UserModel userModel, mycontext});
  logout({required BuildContext mycontext});
  signup({required UserModel userModel, mycontext});
}

String waiterName = '';

class UserDataSourceImpl extends UserDataSource {
  @override
  Future<void> login({required UserModel userModel, mycontext}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);

      waiterName = userModel.email;

      Future.delayed(const Duration(seconds: 1));
      Navigator.push(
        mycontext,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'HATA';
      if (e.code == 'invalid-email' || e.code == 'user-not-found') {
        message = 'Kullanıcı bulunamadı';
      } else if (e.code == 'wrong-password') {
        message = 'Yanlış şifre';
      }

      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg: message,
          backgroundColor: ForestColors.oldTudor.color,
          textColor: ForestColors.goldenFog.color);
    }
  }

  @override
  logout({required mycontext}) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      mycontext,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Future<void> signup({required UserModel userModel, mycontext}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);

      Future.delayed(const Duration(seconds: 1));
      Navigator.push(
        mycontext,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );

      waiterName = userModel.email;
    } on FirebaseAuthException catch (e) {
      String message = 'HATA';
      if (e.code == 'weak-password') {
        message = 'Daha güçlü bir şifre deneyin';
      } else if (e.code == 'email-already-in-use') {
        message = 'Bu hesap zaten mevcut';
      }

      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg: message,
          backgroundColor: ForestColors.oldTudor.color,
          textColor: ForestColors.goldenFog.color);
    } catch (e) {}
  }
}
