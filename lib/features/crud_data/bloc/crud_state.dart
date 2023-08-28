part of 'crud_bloc.dart';

class CrudState extends Equatable {
  const CrudState(this.notes);

  final List<Note> notes;

  @override
  List<Object> get props => [notes];
}
