import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sensor/core/domain/usecases/create_note.dart';
import 'package:flutter_sensor/core/domain/usecases/get_notes.dart';

import '../../../core/domain/entities/note.dart';
import '../../../core/domain/usecases/delete_note.dart';
import '../../../core/domain/usecases/update_note.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final CreateNote createNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;
  final GetNotes getNotes;

  CrudBloc({
    required this.createNote,
    required this.updateNote,
    required this.deleteNote,
    required this.getNotes,
  }) : super(const CrudState([])) {
    on<LoadNotes>((event, emit) async {
      final notes = await getNotes.execute();
      notes.fold((l) {}, (notes) {
        emit(CrudState(notes));
      });
    });
    on<AddNote>((event, emit) async {
      final result = await createNote.execute(event.note);

      result.fold((l) {}, (info) {
        add(LoadNotes());
      });
    });
    on<UpdateNoteById>((event, emit) async {
      final result = await updateNote.execute(event.note);

      result.fold((l) {}, (info) {
        add(LoadNotes());
      });
    });
    on<DeleteNoteById>((event, emit) async {
      final result = await deleteNote.execute(event.id);

      result.fold((l) {}, (info) {
        add(LoadNotes());
      });
    });
  }
}
