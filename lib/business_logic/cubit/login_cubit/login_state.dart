part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingEmail extends LoginState {}

class LoginLoadingGoogle extends LoginState {}

class LoginError extends LoginState {
  Object error;
  LoginError({
    required this.error,
  });
}

class LoginSuccess extends LoginState {}
