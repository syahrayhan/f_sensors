import 'package:location/location.dart';

class LocationHelper {
  final Location _location = Location();

  static final LocationHelper _instance = LocationHelper._internal();

  factory LocationHelper() {
    return _instance;
  }

  LocationHelper._internal();

  Future<LocationData?> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await _location.getLocation();
    return locationData;
  }
}
