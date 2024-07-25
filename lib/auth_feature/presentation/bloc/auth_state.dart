part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class SignUpSucces extends AuthState {
  final User user;

  const SignUpSucces({required this.user});
  @override
  List<Object> get props => [user];
}

class SignUpFailed extends AuthState {}

class LoginSucces extends AuthState {}

class LoginFailed extends AuthState {}

class LogoutSucces extends AuthState {}

class LogoutFailed extends AuthState {}
