import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int? id;
  final String text;
  final String date;
  final String time;

  const Note({
    this.id,
    required this.date,
    required this.text,
    required this.time,
  });

  @override
  List<Object?> get props => [text, date, time, id];
}
