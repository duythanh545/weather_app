import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/util/forecast_util.dart';

import '../model/weather_forecast_model.dart';

int kelvinToCelsius(var kelvin) {
  return (kelvin - 273.15).toInt();
}

dynamic iconForWeather(String stateOfWeather) {
  switch (stateOfWeather) {
    case 'Snow':
      return FontAwesomeIcons.snowman;
      break;
    case 'Clouds':
      return FontAwesomeIcons.cloud;
      break;
    case 'Rain':
      return FontAwesomeIcons.cloudRain;
      break;
    case 'Clear':
      FontAwesomeIcons.sun;
      break;
    default:
      {
        return Icons.refresh_rounded;
      }
  }
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
      DateTime.fromMillisecondsSinceEpoch((forecastList![1].dt! * 1000) ?? 0));

  return Container(
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
          formattedDate,
          style: TextStyle(wordSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${kelvinToCelsius(forecastList[1].main?.temp)} °C',
              style: TextStyle(fontSize: 35),
            ),
            Icon(
              iconForWeather('${forecastList[1].weather![0].main}'),
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
                '${forecastList[1].wind?.speed} ml/h', FontAwesomeIcons.wind)
          ],
        )
      ],
    ),
  );
}
