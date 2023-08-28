part of 'sensors_bloc.dart';

class SensorsState extends Equatable {
  final String x;
  final String y;
  final String z;
  final List<List<double>>? dataPoints;

  const SensorsState({
    this.x = "",
    this.y = "",
    this.z = "",
    this.dataPoints,
  });

  SensorsState copyWith({
    String? x,
    String? y,
    String? z,
    List<List<double>>? dataPoints,
  }) {
    return SensorsState(
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
      dataPoints: dataPoints ?? this.dataPoints,
    );
  }

  @override
  List<Object> get props => [x, y, z, dataPoints ?? ''];
}

class SensorNotFound extends SensorsState {}

class StoppedSensorState extends SensorsState {}
