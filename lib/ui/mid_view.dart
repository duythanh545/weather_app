import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/util/forecast_util.dart';

import '../model/weather_forecast_model.dart';
import '../util/icon_weather.dart';

int kelvinToCelsius(var kelvin) {
  return (kelvin - 273.15).toInt();
}



Widget smallIndex(String value, IconData icon) {
  return Column(
    children: [
      Text(value),
      const SizedBox(
        height: 3,
      ),
      Icon(
        icon,
        color: Colors.grey,
      ),
    ],
  );
}

Widget currentWeather(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  String formattedDate = Util.getFormattedDate(
      DateTime.fromMillisecondsSinceEpoch((forecastList![0].dt! * 1000) ?? 0));

  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.black),
      borderRadius: BorderRadius.circular(10)
    ),
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${snapshot.data!.city!.name}, ${snapshot.data?.city?.country}',
          style: const TextStyle(
            fontSize: 25,
            wordSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Updated: $formattedDate',
          style: TextStyle(wordSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${kelvinToCelsius(forecastList[0].main?.temp)} °C',
              style: TextStyle(fontSize: 35),
            ),
            Icon(
              WeatherIcon.iconForWeather('${forecastList[0].weather![0].main}'),
              size: 45,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            smallIndex('${kelvinToCelsius(forecastList[1].main?.feelsLike)}°C',
                FontAwesomeIcons.faceSmile),
            smallIndex('${forecastList[1].main?.humidity}%', Icons.water_drop),
            smallIndex(
                '${forecastList[1].wind?.speed} m/s', FontAwesomeIcons.wind)
          ],
        )
      ],
    ),
  );
}
