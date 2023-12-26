part of 'auth_user_cubit.dart';

@immutable
sealed class AuthUserState {}

final class AuthUserInitial extends AuthUserState {}

final class LoginInitial extends AuthUserState {}

final class LoginLoading extends AuthUserState {}

final class LoginSuccess extends AuthUserState {}

final class Loginfailure extends AuthUserState {
  final String message;

  Loginfailure({required this.message});
}

final class SigninLoading extends AuthUserState {}

final class SigninSuccess extends AuthUserState {}

final class Signinfailure extends AuthUserState {
  final String message;

  Signinfailure({required this.message});
}
