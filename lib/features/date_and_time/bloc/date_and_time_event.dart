part of 'date_and_time_bloc.dart';

sealed class DateAndTimeEvent extends Equatable {
  const DateAndTimeEvent();

  @override
  List<Object> get props => [];
}

class UpdateDateAndTime extends DateAndTimeEvent {}
