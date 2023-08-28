import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/entities/note.dart';
import 'package:flutter_sensor/core/domain/repositories/notes_repository.dart';

import '../../utils/failure.dart';

class UpdateNote {
  final NotesRepository repository;

  UpdateNote(this.repository);

  Future<Either<Failure, String>> execute(Note data) async {
    return await repository.updateNote(data);
  }
}
