import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/data/datasources/auth_local_datasource.dart';
import 'package:flutter_sensor/core/data/models/user_table.dart';
import 'package:flutter_sensor/core/domain/entities/user.dart';
import 'package:flutter_sensor/core/domain/repositories/auth_repository.dart';
import 'package:flutter_sensor/core/utils/exception.dart';
import 'package:flutter_sensor/core/utils/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(this.authLocalDataSource);

  @override
  Future<Either<Failure, User>> authEmail(String email, String password) async {
    try {
      final result = await authLocalDataSource.signInWithEmail(email, password);
      return Right(result.toEntity());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      final result = await authLocalDataSource.signOut();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmail(
      String email, String password) async {
    try {
      await authLocalDataSource
          .signUp(UserTable(account: email, password: password));
      return const Right("success");
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
