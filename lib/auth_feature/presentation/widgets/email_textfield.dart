import 'package:flutter/material.dart';
import 'package:richie_the_waiter/core/constants.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: ProjectConstants.emailLabelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
