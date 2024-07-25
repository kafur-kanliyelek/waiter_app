import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:richie_the_waiter/auth_feature/data/user_datasource.dart';
import 'package:richie_the_waiter/auth_feature/data/user_repository_impl.dart';
import 'package:richie_the_waiter/auth_feature/domain/usecases/login_usecase.dart';
import 'package:richie_the_waiter/auth_feature/domain/usecases/logout_usecase.dart';
import 'package:richie_the_waiter/auth_feature/domain/usecases/sign_up_usecase.dart';
import 'package:richie_the_waiter/auth_feature/domain/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(_signupEvent);
    on<LoginEvent>(_loginEvent);
    on<LogoutEvent>(_logoutEvent);
  }

  _signupEvent(SignUpEvent event, Emitter emit) {
    try {
      SignUpUseCase(
              userRepository:
                  UserRepositoryImpl(userDataSource: UserDataSourceImpl()))
          .call(event.user, event.context);
      emit(SignUpSucces(user: event.user));
    } catch (e) {
      emit(SignUpFailed);
    }
  }

  _loginEvent(LoginEvent event, Emitter emit) {
    try {
      LoginUseCase(
              userRepository:
                  UserRepositoryImpl(userDataSource: UserDataSourceImpl()))
          .call(event.user, event.context);
      //emit(LoginSucces());
    } catch (e) {
      emit(SignUpFailed);
    }
  }

  _logoutEvent(LogoutEvent event, Emitter emit) {
    try {
      LogoutUseCase(
              userRepository:
                  UserRepositoryImpl(userDataSource: UserDataSourceImpl()))
          .call(event.context);
    } catch (e) {}
  }
}
