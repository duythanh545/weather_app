import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherIcon{
  static dynamic iconForWeather(String stateOfWeather) {
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
}