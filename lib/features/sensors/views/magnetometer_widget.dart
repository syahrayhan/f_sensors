import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/features/sensors/pages/detail_magnometer_page.dart';

import '../bloc/sensors_bloc.dart';

class MagnetoMeterWidget extends StatelessWidget {
  const MagnetoMeterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MagnetometerBloc()..add(FetchSensors()),
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
                  "Magnetometer",
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
    return BlocBuilder<MagnetometerBloc, SensorsState>(
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
                  PageRoutes.push(() => const DetailMagnoMeterPage());
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
