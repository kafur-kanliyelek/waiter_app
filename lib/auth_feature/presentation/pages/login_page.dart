import 'package:flutter/material.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';
import 'package:richie_the_waiter/auth_feature/presentation/widgets/email_textfield.dart';
import 'package:richie_the_waiter/auth_feature/presentation/widgets/goto_registration_page.dart';
import 'package:richie_the_waiter/auth_feature/presentation/widgets/login_button.dart';
import 'package:richie_the_waiter/auth_feature/presentation/widgets/password_textfield.dart';
import 'package:richie_the_waiter/core/colors.dart';
import 'package:richie_the_waiter/core/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    User user = User(name: '', email: '', password: '');
    return Scaffold(
      appBar: AppBar(
          title: Text(ProjectConstants.loginPageTitle,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: ForestColors.oldTudor.color,
                    fontWeight: FontWeight.bold,
                  )),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(flex: 15),
            Expanded(
              flex: 20,
              child: EmailTextField(emailController: emailController),
            ),
            Expanded(
              flex: 20,
              child: PasswordTextField(passwordController: passwordController),
            ),
            const Spacer(flex: 10),
            Expanded(
              flex: 10,
              child: SizedBox(
                  width: double.infinity,
                  child: LoginButton(
                      user: user,
                      emailController: emailController,
                      passwordController: passwordController)),
            ),
            const Expanded(flex: 10, child: GoToRegistrationPage()),
            const Spacer(flex: 15)
          ],
        ),
      )),
    );
  }
}
