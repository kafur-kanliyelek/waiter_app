import 'package:flutter/material.dart';
import 'package:richie_the_waiter/auth_feature/presentation/pages/login_page.dart';
import 'package:richie_the_waiter/core/constants.dart';

class GoToLoginPage extends StatelessWidget {
  const GoToLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text(ProjectConstants.goToLoginPage),
    );
  }
}
