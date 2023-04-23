import 'package:flutter/material.dart';
import 'package:weather_app/network/network.dart';

import '../model/weather_forecast_model.dart';
import 'mid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherForecastModel> forecastObject;
   String _cityName = 'Thanh pho Ho Chi Minh';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeatherForecast(_cityName);

    // forecastObject.then((value) {
    //    print(value.list![0].weather![0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      currentWeather(snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter city name',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onSubmitted: (value) {
        setState(() {
          _cityName = value;
          forecastObject = getWeatherForecast(_cityName);
        });
      },
    );
  }

  Future<WeatherForecastModel> getWeatherForecast(String cityName) =>
      Network().getWeatherForecast(cityName: _cityName);
}
