part of 'device_info_bloc.dart';

sealed class DeviceInfoEvent extends Equatable {
  const DeviceInfoEvent();

  @override
  List<Object> get props => [];
}

class FetchDeviceInfo extends DeviceInfoEvent {}
