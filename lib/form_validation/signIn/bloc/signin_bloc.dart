import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SingInFieldsChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SinginErrorState(error: "Please,Enter Valid Email!"));
      } else if (event.passwordValue.length < 8) {
        emit(SinginErrorState(error: "Min 8 Characters Required!"));
      } else {
        emit(SigninValidState());
      }
    });
    on<SingInButtonEvent>((event, emit) {
      emit(SinginLoadingState());
    });
  }
}
