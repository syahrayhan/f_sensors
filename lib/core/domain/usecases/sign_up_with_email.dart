import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/repositories/auth_repository.dart';
import 'package:flutter_sensor/core/utils/failure.dart';

class SignUpWithEmail {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  Future<Either<Failure, String>> execute(String email, String password) async {
    return await repository.signUpWithEmail(email, password);
  }
}
