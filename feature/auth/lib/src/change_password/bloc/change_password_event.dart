part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class ChangePassword extends ChangePasswordEvent {
  const ChangePassword();
}

class NavigateBackEvent extends ChangePasswordEvent {
  const NavigateBackEvent();
}