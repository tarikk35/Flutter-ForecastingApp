import './city.dart';

class Weather {
  final int statusId;
  final String iconUrl;
  final double temperature;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final City city;
  bool hasError=true;
  Weather(
      {this.iconUrl,
      this.statusId,
      this.temperature,
      this.pressure,
      this.humidity,
      this.windSpeed,
      this.city,
      this.hasError});

  factory Weather.fromJson(Map json) {
    print('Transforming...');
    if (json['cod'] == 200) {
      return Weather(
          city: City(
            cityId: json['id'],
            cityName: json['name'],
            country: json['sys']['country'],
          ),
          statusId: json['weather'][0]['id'],
          hasError: false,
          iconUrl:
              'http://openweathermap.org/img/w/${json['weather'][0]['icon']}.png',
          temperature: double.parse(json['main']['temp'].toString()),
          pressure: json['main']['pressure'],
          humidity: json['main']['humidity'],
          windSpeed: double.parse(json['wind']['speed'].toString()));
    } else {
      return Weather();
    }
  }
}
