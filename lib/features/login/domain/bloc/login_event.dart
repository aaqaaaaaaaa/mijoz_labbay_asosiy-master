part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class IsLoginEvent extends LoginEvent{
  final String phoneNum;
  IsLoginEvent(this.phoneNum);
}
