import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/repositories/notes_repository.dart';

import '../../utils/failure.dart';
import '../entities/note.dart';

class CreateNote {
  final NotesRepository repository;

  CreateNote(this.repository);

  Future<Either<Failure, String>> execute(Note data) async {
    return await repository.createNote(data);
  }
}
