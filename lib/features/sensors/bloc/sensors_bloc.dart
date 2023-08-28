import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sensors_event.dart';
part 'sensors_state.dart';

class AcceleroMeterBloc extends Bloc<SensorsEvent, SensorsState> {
  final sensors = Sensors();
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  AcceleroMeterBloc() : super(const SensorsState()) {
    on<FetchSensors>((event, emit) async {
      _accelerometerSubscription?.cancel(); // Cancel any previous subscription

      _accelerometerSubscription = sensors.accelerometerEvents.listen(
        (sensorData) async {
          debugPrint("Accelerometer running");
          debugPrint(sensorData.x.toString());
          debugPrint(sensorData.y.toString());
          debugPrint(sensorData.z.toString());

          _accelerometerSubscription?.cancel();

          add(UpdateSensors(
            x: sensorData.x.toStringAsFixed(2),
            y: sensorData.y.toStringAsFixed(2),
            z: sensorData.z.toStringAsFixed(2),
          ));
        },
        onError: (error) {
          emit(SensorNotFound());
        },
        cancelOnError: true,
      );
    });

    on<UpdateSensors>((event, emit) async {
      List<List<double>> updatedDataPoints = [];
      updatedDataPoints.add([
        double.parse(event.x),
        double.parse(event.y),
        double.parse(event.z)
      ]);

      emit(state.copyWith(
        x: event.x,
        y: event.y,
        z: event.z,
        dataPoints: updatedDataPoints,
      ));

      await Future.delayed(const Duration(seconds: 3));
      if (isClosed) return;
      add(FetchSensors());
    });
  }

  @override
  Future<void> close() {
    _accelerometerSubscription?.cancel();
    return super.close();
  }
}

class GyroscopeBloc extends Bloc<SensorsEvent, SensorsState> {
  final sensors = Sensors();
  StreamSubscription<GyroscopeEvent>? _accelerometerSubscription;

  GyroscopeBloc() : super(const SensorsState()) {
    on<FetchSensors>((event, emit) async {
      _accelerometerSubscription?.cancel(); // Cancel any previous subscription

      _accelerometerSubscription = sensors.gyroscopeEvents.listen(
        (sensorData) async {
          debugPrint("Gyroscope running");
          debugPrint(sensorData.x.toString());
          debugPrint(sensorData.y.toString());
          debugPrint(sensorData.z.toString());

          add(UpdateSensors(
            x: sensorData.x.toStringAsFixed(2),
            y: sensorData.y.toStringAsFixed(2),
            z: sensorData.z.toStringAsFixed(2),
          ));
        },
        onError: (error) {
          emit(SensorNotFound());
        },
        cancelOnError: true,
      );
    });

    on<UpdateSensors>((event, emit) async {
      _accelerometerSubscription?.cancel();

      List<List<double>> updatedDataPoints = [];
      updatedDataPoints.add([
        double.parse(event.x),
        double.parse(event.y),
        double.parse(event.z)
      ]);

      emit(state.copyWith(
        x: event.x,
        y: event.y,
        z: event.z,
        dataPoints: updatedDataPoints,
      ));

      await Future.delayed(const Duration(seconds: 3));
      if (isClosed) return;
      add(FetchSensors());
    });
  }

  @override
  Future<void> close() {
    _accelerometerSubscription?.cancel();
    return super.close();
  }
}

class MagnetometerBloc extends Bloc<SensorsEvent, SensorsState> {
  final sensors = Sensors();
  StreamSubscription<MagnetometerEvent>? _accelerometerSubscription;

  MagnetometerBloc() : super(const SensorsState()) {
    on<FetchSensors>((event, emit) async {
      _accelerometerSubscription?.cancel(); // Cancel any previous subscription

      _accelerometerSubscription = sensors.magnetometerEvents.listen(
        (sensorData) async {
          debugPrint("Magnetometer running");
          debugPrint(sensorData.x.toString());
          debugPrint(sensorData.y.toString());
          debugPrint(sensorData.z.toString());

          add(UpdateSensors(
            x: sensorData.x.toStringAsFixed(2),
            y: sensorData.y.toStringAsFixed(2),
            z: sensorData.z.toStringAsFixed(2),
          ));
        },
        onError: (error) {
          emit(SensorNotFound());
        },
        cancelOnError: true,
      );
    });

    on<UpdateSensors>((event, emit) async {
      _accelerometerSubscription?.cancel();

      List<List<double>> updatedDataPoints = [];
      updatedDataPoints.add([
        double.parse(event.x),
        double.parse(event.y),
        double.parse(event.z)
      ]);
      emit(state.copyWith(
        x: event.x,
        y: event.y,
        z: event.z,
        dataPoints: updatedDataPoints,
      ));

      await Future.delayed(const Duration(seconds: 3));
      if (isClosed) return;
      add(FetchSensors());
    });
  }

  @override
  Future<void> close() {
    _accelerometerSubscription?.cancel();
    return super.close();
  }
}
