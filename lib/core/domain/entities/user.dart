import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? account;
  final String? password;

  const User({
    required this.account,
    required this.password,
  });

  @override
  List<Object?> get props => [account, password];
}
