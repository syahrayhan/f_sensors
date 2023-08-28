import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sensor/core/helpers/location_helper.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationHelper locationHelper = LocationHelper();
  LocationBloc() : super(LocationInitial()) {
    on<FetchLocation>((event, emit) async {
      LocationData? locationData = await locationHelper.getCurrentLocation();
      emit(LocationLoaded(locationData));
    });
  }
}
