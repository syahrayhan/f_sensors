import 'package:flutter/material.dart';
import 'package:flutter_sensor/core/widgets/menu/nav_drawer.dart';
import 'package:flutter_sensor/features/date_and_time/view/date_time_widget.dart';
import 'package:flutter_sensor/features/location/views/lat_lot_widget.dart';
import 'package:flutter_sensor/features/sensors/views/accelero_meter_widget.dart';

import '../../battery_info/views/battery_info_widget.dart';
import '../../sensors/views/gyro_widget.dart';
import '../../sensors/views/magnetometer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text("Flutter Sensors"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DateTimeWidget(),
            const SizedBox(height: 14),
            Text(
              "Device Sensors",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: AcceleroMeterWidget()),
                Expanded(child: GyroWidget()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: MagnetoMeterWidget()),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              "Battery Info",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            const BatteryInfoWidget(),
            const SizedBox(height: 14),
            Text(
              "My Coordinate",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            const LatLotWidget()
          ],
        ),
      ),
    );
  }
}
