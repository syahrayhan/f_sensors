import 'package:equatable/equatable.dart';
import 'package:flutter_sensor/core/domain/entities/note.dart';

class NoteTable extends Equatable {
  final int? id;
  final String text;
  final String date;
  final String time;

  const NoteTable({
    this.id,
    required this.date,
    required this.text,
    required this.time,
  });

  factory NoteTable.fromEntity(Note note) => NoteTable(
        date: note.date,
        text: note.text,
        time: note.time,
        id: note.id,
      );

  factory NoteTable.fromMap(Map<String, dynamic> map) => NoteTable(
        date: map['date'],
        text: map['text'],
        time: map['time'],
        id: map['id'],
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'text': text,
        'time': time,
      };

  Note toEntity() => Note(
        date: date,
        text: text,
        time: time,
        id: id,
      );

  @override
  List<Object?> get props => [id, text, date, time];
}
