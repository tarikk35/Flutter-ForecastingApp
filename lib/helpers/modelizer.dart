import '../models/weather_model.dart';
import '../models/city.dart';

class Modelize {
  final Map json;
  final Weather _weather;
  Modelize({this.json})
      : _weather = Weather(
            city: City(
              cityId: json['id'],
              cityName: json['name'],
              country: json['sys']['country'],
            ),
            statusId: json['weather'][0]['id'],
            icon: json['weather'][0]['icon'],
            temperature: json['main']['temp'],
            pressure: json['main']['pressure'],
            humidity: json['main']['humidity'],
            windSpeed: json['wind']['speed']);

  Weather getWeather(){
    return _weather;
  }
}
