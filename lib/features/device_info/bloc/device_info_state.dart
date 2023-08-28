part of 'device_info_bloc.dart';

class DeviceInfoState extends Equatable {
  final AndroidDeviceInfo? androidDeviceInfo;

  const DeviceInfoState([this.androidDeviceInfo]);

  @override
  List<Object> get props => [androidDeviceInfo ?? ''];
}
