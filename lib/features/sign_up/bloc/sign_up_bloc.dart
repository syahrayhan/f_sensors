import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sensor/core/domain/usecases/sign_up_with_email.dart';
import 'package:flutter_sensor/core/utils/text_validator.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpWithEmail signUpWithEmail;
  SignUpBloc({required this.signUpWithEmail}) : super(SignUpInitial()) {
    on<SignUpEventReset>((event, emit) => emit(SignUpInitial()));
    on<SignUpWithEmailSubmmited>((event, emit) async {
      final email = event.email ?? '';
      final password = event.password ?? '';

      emit(SignUpLoading());

      if (!TextValidator.isEmailValid(email)) {
        return emit(const SignUpFail(message: "Email Invalid"));
      }

      if (password.length < 3) {
        return emit(
          const SignUpFail(message: "Minimum password is 3 character"),
        );
      }

      final result = await signUpWithEmail.execute(email, password);

      result.fold((failure) {
        emit(SignUpFail(message: failure.toString()));
      }, (success) {
        emit(SignUpSuccess());
      });
    });
  }
}
