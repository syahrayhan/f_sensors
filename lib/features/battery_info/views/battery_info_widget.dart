import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/dependencie_injection.dart';
import 'package:flutter_sensor/features/battery_info/bloc/battery_info_bloc.dart';

class BatteryInfoWidget extends StatelessWidget {
  const BatteryInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BatteryInfoBloc>()..add(FetchBatteryInfo()),
      child: BlocBuilder<BatteryInfoBloc, BatteryInfoState>(
        builder: (context, state) {
          if (state is BatteryInfoLoaded) {
            return SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Capacity : ${state.androidBatteryInfo?.batteryCapacity}',
                      ),
                      Text(
                        'Level : ${state.androidBatteryInfo?.batteryLevel}',
                      ),
                      Text(
                        'Charge Time : ${state.androidBatteryInfo?.chargeTimeRemaining}',
                      ),
                      Text(
                        'Healt : ${state.androidBatteryInfo?.health}',
                      ),
                      Text(
                        'Temperature : ${state.androidBatteryInfo?.temperature}',
                      ),
                      Text(
                        'Voltage : ${state.androidBatteryInfo?.voltage} mV',
                      ),
                      Text(
                        'Technology : ${state.androidBatteryInfo?.technology}',
                      ),
                      Text(
                        'Plug Status : ${state.androidBatteryInfo?.pluggedStatus}',
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: Text("Loading battery info"),
          );
        },
      ),
    );
  }
}
