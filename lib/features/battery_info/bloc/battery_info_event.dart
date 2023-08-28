part of 'battery_info_bloc.dart';

sealed class BatteryInfoEvent extends Equatable {
  const BatteryInfoEvent();

  @override
  List<Object> get props => [];
}

class FetchBatteryInfo extends BatteryInfoEvent {}

class UpdateBatteryInfoData extends BatteryInfoEvent {
  final AndroidBatteryInfo? androidBatteryInfo;

  const UpdateBatteryInfoData(this.androidBatteryInfo);

  @override
  List<Object> get props => [androidBatteryInfo ?? ""];
}
