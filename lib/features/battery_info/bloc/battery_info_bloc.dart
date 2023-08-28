import 'dart:async';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'battery_info_event.dart';
part 'battery_info_state.dart';

class BatteryInfoBloc extends Bloc<BatteryInfoEvent, BatteryInfoState> {
  final BatteryInfoPlugin batteryInfo;
  StreamSubscription<AndroidBatteryInfo?>? _streamSubscription;

  BatteryInfoBloc(this.batteryInfo) : super(BatteryInfoInitial()) {
    on<FetchBatteryInfo>((event, emit) {
      debugPrint("get battery info");
      _streamSubscription?.cancel();
      _streamSubscription =
          batteryInfo.androidBatteryInfoStream.listen((event) {
        add(UpdateBatteryInfoData(event));
      });
    });

    on<UpdateBatteryInfoData>((event, emit) {
      emit(BatteryInfoLoaded(event.androidBatteryInfo));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
