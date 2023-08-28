import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';

part 'device_info_event.dart';
part 'device_info_state.dart';

class DeviceInfoBloc extends Bloc<DeviceInfoEvent, DeviceInfoState> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  DeviceInfoBloc() : super(const DeviceInfoState()) {
    on<FetchDeviceInfo>((event, emit) async {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

      emit(DeviceInfoState(androidInfo));
    });
  }
}
