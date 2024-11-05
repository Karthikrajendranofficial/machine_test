import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:machine_test_karthik/features/weather/models/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_controller.g.dart';
part 'weather_controller.freezed.dart';

@freezed
class WeatherControllerState with _$WeatherControllerState {
  const factory WeatherControllerState({
    required Position? currentLocation,
    required WeatherResponseModel? weatherData,
  }) = _WeatherControllerState;
}

@riverpod
class WeatherController extends _$WeatherController {
  @override
  WeatherControllerState build() {
    determinePosition();

    return const WeatherControllerState(
      currentLocation: null,
      weatherData: null,
    );
  }

  Future<void> searchWeatherData(String location) async {}

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final location = await Geolocator.getCurrentPosition();

    state = state.copyWith(currentLocation: location);
    return location;
  }
}
