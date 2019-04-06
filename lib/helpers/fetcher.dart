import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:climatic/utils/utils.dart' as util;
import 'package:climatic/models/weather.dart';

class Fetcher{

  Future<Weather> getWeather(String city) async{
  String url='http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=${util.apiKey}&units=metric';
  print(url);
  final http.Response response=await http.get(url);
  print('Responded');
  return Weather.fromJson(json.decode(response.body));
}
}