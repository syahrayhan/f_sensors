part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();
  
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationData? locationData;

  const LocationLoaded(this.locationData);

  @override
  List<Object> get props => [locationData ?? ''];
}