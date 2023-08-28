import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_and_time_event.dart';
part 'date_and_time_state.dart';

class DateAndTimeBloc extends Bloc<DateAndTimeEvent, DateAndTimeState> {
  DateAndTimeBloc() : super(DateAndTimeState(DateTime.now())) {
    _startUpdatingTime();

    on<UpdateDateAndTime>((event, emit) {
      emit(DateAndTimeState(DateTime.now()));
    });
  }

  late Timer _timer;

  void _startUpdatingTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(UpdateDateAndTime());
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
