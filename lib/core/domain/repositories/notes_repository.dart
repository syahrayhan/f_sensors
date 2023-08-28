import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/domain/entities/note.dart';
import 'package:flutter_sensor/core/utils/failure.dart';

abstract class NotesRepository {
  Future<Either<Failure, String>> createNote(Note data);
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, String>> deleteNote(id);
  Future<Either<Failure, String>> updateNote(Note data);
}
