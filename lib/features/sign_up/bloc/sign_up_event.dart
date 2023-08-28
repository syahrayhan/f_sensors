part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEventReset extends SignUpEvent {}

class SignUpWithEmailSubmmited extends SignUpEvent {
  final String? email;
  final String? password;

  const SignUpWithEmailSubmmited({this.email, this.password});
}
