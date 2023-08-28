part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEventReset extends SignInEvent {}

class SignInWithFingerPrint extends SignInEvent {}

class SignInWithNFC extends SignInEvent {}

class SignInWithEmailSubmmited extends SignInEvent {
  final String? email;
  final String? password;

  const SignInWithEmailSubmmited({this.email, this.password});
}
