import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/features/sensors/bloc/sensors_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailAcceleroMeterPage extends StatelessWidget {
  const DetailAcceleroMeterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcceleroMeterBloc()..add(FetchSensors()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Accelerometer"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Accelerometer",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const _Body(),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<AcceleroMeterBloc, SensorsState>(
                  builder: (context, state) {
                List<List<double>> dataPoints = state.dataPoints ?? [];

                List<ColumnSeries<List<double>, num>> getDefaultColumnSeries() {
                  return <ColumnSeries<List<double>, num>>[
                    ColumnSeries<List<double>, num>(
                      dataSource: dataPoints,
                      color: Colors.amber,
                      xValueMapper: (List<double> data, _) => data[0],
                      yValueMapper: (List<double> data, _) => data[0],
                    ),
                    ColumnSeries<List<double>, num>(
                      dataSource: dataPoints,
                      color: Colors.red,
                      xValueMapper: (List<double> data, _) => data[1],
                      yValueMapper: (List<double> data, _) => data[1],
                    ),
                    ColumnSeries<List<double>, num>(
                      dataSource: dataPoints,
                      color: Colors.green,
                      xValueMapper: (List<double> data, _) => data[2],
                      yValueMapper: (List<double> data, _) => data[2],
                    )
                  ];
                }

                return SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                    majorTickLines:
                        const MajorTickLines(color: Colors.transparent),
                    axisLine: const AxisLine(width: 0),
                    minimum: -10,
                    maximum: 10,
                  ),
                  series: getDefaultColumnSeries(),
                );
              }),
            ],
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
    return BlocBuilder<AcceleroMeterBloc, SensorsState>(
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
          ],
        );
      },
    );
  }
}
