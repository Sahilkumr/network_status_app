import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  bool _isValid = false;
  SigninBloc() : super(SigninInitial()) {
    on<SingInFieldsChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SinginErrorState(error: "Please,Enter Valid Email!"));
      } else if (event.passwordValue.length < 8) {
        emit(SinginErrorState(error: "Min 8 Characters Required!"));
      } else {
        emit(SigninValidState());
        _isValid = true;
      }
    });
    on<SingInButtonEvent>((event, emit) {
      if (_isValid) {
        emit(SinginLoadingState());
      } else {
        emit(SigninInvalidState(whyInvalid: 'Please Verify the Fields!'));
      }
    });
  }
}
