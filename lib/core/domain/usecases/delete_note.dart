import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/repositories/notes_repository.dart';

import '../../utils/failure.dart';

class DeleteNote {
  final NotesRepository repository;

  DeleteNote(this.repository);

  Future<Either<Failure, String>> execute(id) async {
    return await repository.deleteNote(id);
  }
}
