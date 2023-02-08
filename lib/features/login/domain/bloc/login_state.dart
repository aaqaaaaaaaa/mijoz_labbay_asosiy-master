part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class SignIn extends LoginState {}
class LoginFailed extends LoginState {}

