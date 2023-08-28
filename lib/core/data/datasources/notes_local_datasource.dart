import 'package:flutter_sensor/core/data/models/note_table.dart';
import 'package:flutter_sensor/core/domain/entities/note.dart';
import 'package:flutter_sensor/core/utils/exception.dart';

import 'db/database_helper.dart';

abstract class NotesLocalDatasource {
  Future<String> createNote(Note note);
  Future<List<Note>> getAllNotes();
  Future<String> updateNote(Note note);
  Future<String> deleteNote(id);
}

class NotesLocalDatasourceImpl extends NotesLocalDatasource {
  final DatabaseHelper databaseHelper;

  NotesLocalDatasourceImpl(this.databaseHelper);

  @override
  Future<String> createNote(Note note) async {
    try {
      await databaseHelper.insertNote(NoteTable.fromEntity(note));
      return "success";
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> deleteNote(id) async {
    try {
      await databaseHelper.deleteNote(id);
      return 'success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<Note>> getAllNotes() async {
    try {
      final result = await databaseHelper.getAllNotes();

      return result.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> updateNote(Note note) async {
    try {
      await databaseHelper.updateNote(NoteTable.fromEntity(note));
      return 'success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
