import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/dependencie_injection.dart';
import 'package:flutter_sensor/features/location/bloc/location_bloc.dart';
import 'package:flutter_sensor/features/location/pages/map_page.dart';

class LatLotWidget extends StatelessWidget {
  const LatLotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocationBloc>()..add(FetchLocation()),
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoaded) {
            final latitude = state.locationData?.latitude;
            final longitude = state.locationData?.longitude;

            return SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    children: [
                      Text(
                        "Latitude : $latitude",
                      ),
                      Text(
                        "Longitude : $longitude",
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            PageRoutes.push(
                              () => MapPage(
                                lat: state.locationData?.latitude ?? 0,
                                lot: state.locationData?.longitude ?? 0,
                              ),
                            );
                          },
                          child: Text(
                            "View Map",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Text("Loading Location");
        },
      ),
    );
  }
}
