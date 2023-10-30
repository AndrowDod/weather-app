import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "fe00dd29cf0c4b3e8d8153500222712";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.formjson(data);
    return weather;
  }
}
