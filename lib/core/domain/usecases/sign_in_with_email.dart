import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/entities/user.dart';
import 'package:flutter_sensor/core/domain/repositories/auth_repository.dart';
import 'package:flutter_sensor/core/utils/failure.dart';

class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) async {
    return await repository.authEmail(email, password);
  }
}
