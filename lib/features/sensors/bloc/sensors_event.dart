part of 'sensors_bloc.dart';

sealed class SensorsEvent extends Equatable {
  const SensorsEvent();

  @override
  List<Object> get props => [];
}

class InitialSensorsEvent extends SensorsEvent {}

class FetchSensors extends SensorsEvent {}

class UpdateSensors extends SensorsEvent {
  final String x;
  final String y;
  final String z;

  const UpdateSensors({
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  List<Object> get props => [x, y, z];
}
