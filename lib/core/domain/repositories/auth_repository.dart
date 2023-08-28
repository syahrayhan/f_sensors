import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/entities/user.dart';

import '../../utils/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> authEmail(String email, String password);
  Future<Either<Failure, String>> signOut();
  Future<Either<Failure, String>> signUpWithEmail(
      String email, String password);
}
