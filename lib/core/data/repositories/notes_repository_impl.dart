import 'package:dartz/dartz.dart';
import 'package:flutter_sensor/core/data/datasources/notes_local_datasource.dart';
import 'package:flutter_sensor/core/domain/entities/note.dart';
import 'package:flutter_sensor/core/domain/repositories/notes_repository.dart';
import 'package:flutter_sensor/core/utils/exception.dart';
import 'package:flutter_sensor/core/utils/failure.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDatasource localDatasource;

  NotesRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, String>> createNote(Note data) async {
    try {
      final result = await localDatasource.createNote(data);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteNote(id) async {
    try {
      final result = await localDatasource.deleteNote(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      final result = await localDatasource.getAllNotes();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateNote(Note data) async {
    try {
      final result = await localDatasource.updateNote(data);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
