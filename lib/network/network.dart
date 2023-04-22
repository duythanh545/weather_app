import 'dart:convert';

import 'package:http/http.dart';

import '../model/weather_forcast_model.dart';
import '../util/forecast_util.dart';

class Network {
  Future<WeatherForcastModel> getWeatherForecast(
      {required String cityName}) async {
    //Thanh%20pho%20Ho%20Chi%20Minh
    //e7db556f459941df6daaee5cdfb0a0ca
    var finalUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Util.appId}';
    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    print('URL: ${Uri.encodeFull(finalUrl)}');
    if (response.statusCode == 200) {
      print('Weather data: ${response.body}');
      return WeatherForcastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error getting weather forecast');
    }
  }
}
