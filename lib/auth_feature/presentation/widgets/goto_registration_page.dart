import 'package:flutter/material.dart';
import 'package:richie_the_waiter/auth_feature/presentation/pages/sign_up_page.dart';
import 'package:richie_the_waiter/core/constants.dart';

class GoToRegistrationPage extends StatelessWidget {
  const GoToRegistrationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPage()),
          );
        },
        child: const Text(ProjectConstants.goToRegistrationPage));
  }
}
