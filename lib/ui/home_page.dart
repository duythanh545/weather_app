import 'package:flutter/material.dart';
import 'package:weather_app/network/network.dart';

import '../model/weather_forcast_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherForcastModel> forecastObject;
  String _cityName = 'Thanh pho Ho Chi Minh';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);

    forecastObject.then((value) {
      print(value.city?.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Container(),
    );
  }
}
