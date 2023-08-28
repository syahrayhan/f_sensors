import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/features/sensors/pages/detail_gyro_page.dart';

import '../bloc/sensors_bloc.dart';

class GyroWidget extends StatelessWidget {
  const GyroWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GyroscopeBloc()..add(FetchSensors()),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            child: Column(
              children: [
                Text(
                  "Gyroscope",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const _Body(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GyroscopeBloc, SensorsState>(
      builder: (context, state) {
        if (state is SensorNotFound) {
          return const Text("Not Support");
        }
        return Column(
          children: [
            const SizedBox(height: 8),
            Text("X : ${state.x}"),
            Text("Y : ${state.y}"),
            Text("Z : ${state.z}"),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  PageRoutes.push(() => const DetailGyroPage());
                },
                child: Text(
                  "View",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
