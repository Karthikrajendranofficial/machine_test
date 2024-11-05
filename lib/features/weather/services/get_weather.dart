import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machine_test_karthik/features/weather/models/weather_model.dart';
import 'package:machine_test_karthik/secrets.dart';

class GetWeather {
  Future<WeatherResponseModel> getWeather(String location) async {
    final response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=$apikey&q=$location&aqi=no"));

    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);

      return WeatherResponseModel.fromJson(weatherData);
    } else {
      throw Exception("Failed to get weather data: ${response.statusCode}");
    }
  }
}
