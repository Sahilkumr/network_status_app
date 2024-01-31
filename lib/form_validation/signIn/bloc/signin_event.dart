part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

final class SingInFieldsChangedEvent extends SigninEvent {
  final String emailValue;
  final String passwordValue;

  SingInFieldsChangedEvent({
    required this.emailValue,
    required this.passwordValue,
  });
}

final class SingInButtonEvent extends SigninEvent {
  final String email;
  final String password;

  SingInButtonEvent({
    required this.email,
    required this.password,
  });
}
