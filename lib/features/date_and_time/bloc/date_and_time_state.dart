part of 'date_and_time_bloc.dart';

class DateAndTimeState extends Equatable {
  final DateTime dateTime;

  const DateAndTimeState(this.dateTime);

  @override
  List<Object> get props => [dateTime];
}
