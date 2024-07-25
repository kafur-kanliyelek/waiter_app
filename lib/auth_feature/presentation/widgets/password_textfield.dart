import 'package:flutter/material.dart';
import 'package:richie_the_waiter/core/constants.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: ProjectConstants.passwordLabelText,
      ),
      obscureText: true,
    );
  }
}
