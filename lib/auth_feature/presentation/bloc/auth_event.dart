part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final User user;
  final BuildContext? context;

  const SignUpEvent({this.context, required this.user});

  @override
  List<Object> get props => [user];
}

class LoginEvent extends AuthEvent {
  final User user;
  final BuildContext? context;

  const LoginEvent({this.context, required this.user});

  @override
  List<Object> get props => [user];
}

class LogoutEvent extends AuthEvent {
  final BuildContext context;

  const LogoutEvent({required this.context});

  @override
  List<Object> get props => [context];
}
