import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/repositories/notes_repository.dart';

import '../../utils/failure.dart';
import '../entities/note.dart';

class GetNotes {
  final NotesRepository repository;

  GetNotes(this.repository);

  Future<Either<Failure, List<Note>>> execute() async {
    return await repository.getNotes();
  }
}
