import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';
import 'package:richie_the_waiter/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:richie_the_waiter/core/colors.dart';
import 'package:richie_the_waiter/core/constants.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.user,
    required this.emailController,
    required this.passwordController,
  });

  final User user;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        user.email = emailController.text;
        user.password = passwordController.text;
        BlocProvider.of<AuthBloc>(context)
            .add(SignUpEvent(user: user, context: context));
      },
      child: Text(
        ProjectConstants.signupPageTitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ForestColors.goldenFog.color,
            ),
      ),
    );
  }
}
