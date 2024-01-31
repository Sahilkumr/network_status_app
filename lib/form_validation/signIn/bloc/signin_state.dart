part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninValidState extends SigninState {}

final class SigninInvalidState extends SigninState {}

final class SinginLoadingState extends SigninState {}

final class SinginErrorState extends SigninState {
  final String error;

  SinginErrorState({
    required this.error,
  });
}
