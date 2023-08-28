part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFingerPrintNotSupport extends SignInState {}

class SignInNFCNotSupport extends SignInState {}

class SignInNFCStanBy extends SignInState {}

class SignInFail extends SignInState {
  final String message;

  const SignInFail({required this.message});

  @override
  List<Object> get props => [message];
}
