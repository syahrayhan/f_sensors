import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../repositories/auth_repository.dart';

class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either<Failure, String>> execute() async {
    return await repository.signOut();
  }
}
