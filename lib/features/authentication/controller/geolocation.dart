import 'package:geolocator/geolocator.dart';

class Geolocation {
  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied, the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled; request users to enable them.
      return Future.error('Location services are disabled.');
    }

    // Check current permission status.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied; inform the user.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever; handle appropriately.
      return Future.error(
          'Location permissions are permanently denied. We cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can access the position of the device.
    Position currentPosition = await Geolocator.getCurrentPosition();
    print(
        'Current Position: $currentPosition'); // Log or handle the position as needed
    return currentPosition;
  }
}
