import './city.dart';

class Weather {
  final int statusId;
  final String icon;
  final double temperature;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final City city;
  Weather({this.icon, this.statusId, this.temperature,this.pressure,this.humidity,this.windSpeed,this.city});
}
