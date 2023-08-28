part of 'crud_bloc.dart';

sealed class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends CrudEvent {}

class AddNote extends CrudEvent {
  final Note note;

  const AddNote(this.note);

  @override
  List<Object> get props => [note];
}

class UpdateNoteById extends CrudEvent {
  final Note note;

  const UpdateNoteById(this.note);

  @override
  List<Object> get props => [note];
}

class DeleteNoteById extends CrudEvent {
  final int id;

  const DeleteNoteById(this.id);

  @override
  List<Object> get props => [id];
}
