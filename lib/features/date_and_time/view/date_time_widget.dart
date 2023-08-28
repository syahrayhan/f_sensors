import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/dependencie_injection.dart';

import '../bloc/date_and_time_bloc.dart';


class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DateAndTimeBloc>(),
      child: BlocBuilder<DateAndTimeBloc, DateAndTimeState>(
        builder: (context, state) {
          final formattedDate =
              '${state.dateTime.year}-${state.dateTime.month}-${state.dateTime.day}';
          final formattedTime =
              '${state.dateTime.hour}:${state.dateTime.minute}:${state.dateTime.second}';
          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Date: $formattedDate',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Time: $formattedTime',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
