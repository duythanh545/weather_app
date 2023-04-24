import 'package:flutter/material.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';
import '../util/icon_weather.dart';

int kelvinToCelsius(var kelvin) {
  return (kelvin - 273.15).toInt();
}

Widget futureForecast(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data!.list;
  String formattedTime(int index) {
    return Util.getFormattedTime(DateTime.fromMillisecondsSinceEpoch(
        (forecastList![index].dt! * 1000) ?? 0));
  }

  String formattedDate(int index) {
    return Util.getFormattedDate2(DateTime.fromMillisecondsSinceEpoch(
        (forecastList![index].dt! * 1000) ?? 0));
  }

  int length = forecastList!.length -1 ;

  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(20),
    height: 400,
    width: 400,
    decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(10)),
    child: ListView.builder(
        itemBuilder: (context, index) {
          //take a element 1 at first
          index++;

          return ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(formattedTime(index)),
                Text(formattedDate(index))
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${kelvinToCelsius(forecastList![index].main?.temp)}°C', style: TextStyle(fontSize: 25,),textAlign: TextAlign.center,
                ),
                Icon(WeatherIcon.iconForWeather(
                    '${forecastList[index].weather![0].main}'), size: 30,)
              ],
            ),

          );
        },
        itemCount: length),
  );
}
