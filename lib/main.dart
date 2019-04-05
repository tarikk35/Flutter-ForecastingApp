import 'package:flutter/material.dart';

import 'pages/main_page.dart';
import 'helpers/weather_json.dart';
import 'helpers/modelizer.dart';
import 'models/weather_model.dart';
// °C

void main() async {
  final _json = await WeatherJson().getWeather('Izmir');
  final _weather = Modelize(json: _json).getWeather();
  runApp(MyApp(weather: _weather));
}

class MyApp extends StatelessWidget {
  final Weather weather;
  MyApp({this.weather});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(weather),
    );
  }
}
