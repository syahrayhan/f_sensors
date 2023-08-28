import 'package:equatable/equatable.dart';
import 'package:flutter_sensor/core/domain/entities/user.dart';

class UserTable extends Equatable {
  final String? account;
  final String? password;

  const UserTable({
    required this.account,
    required this.password,
  });

  factory UserTable.fromEntity(User user) => UserTable(
        account: user.account,
        password: user.password,
      );

  factory UserTable.fromMap(Map<String, dynamic> map) => UserTable(
        account: map['account'],
        password: map['password'],
      );

  Map<String, dynamic> toJson() => {
        'account': account,
        'password': password,
      };

  User toEntity() => User(
        account: account,
        password: password,
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}
