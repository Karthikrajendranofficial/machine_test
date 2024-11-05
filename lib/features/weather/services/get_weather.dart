import 'package:http/http.dart' as http;
import 'package:machine_test_karthik/features/weather/model/weather_model.dart';
import 'package:machine_test_karthik/features/weather/services/api_key.dart';
import 'dart:convert';

class GetWeather {
  Future<Welcome> getWeather(String location) async {
    try {
      final response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=$apikey&q=$location&aqi=no"));

      if (response.statusCode == 200) {
        var weatherData = json.decode(response.body);

        return Welcome.fromJson(weatherData);
      } else {
        throw Exception("Failed to get weather data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Loading Weather Failed");
    }
  }
}
