part of 'battery_info_bloc.dart';

class BatteryInfoState extends Equatable {
  const BatteryInfoState();

  @override
  List<Object> get props => [];
}

class BatteryInfoInitial extends BatteryInfoState {}

class BatteryInfoLoaded extends BatteryInfoState {
  final AndroidBatteryInfo? androidBatteryInfo;

  const BatteryInfoLoaded(this.androidBatteryInfo);

  @override
  List<Object> get props => [androidBatteryInfo ?? ''];
}
