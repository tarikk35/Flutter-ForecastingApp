import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:climatic/utils/utils.dart' as util;

class WeatherJson{

  Future<Map> getWeather(String city) async{
  String url='http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=${util.apiKey}&units=metric';
  http.Response response=await http.get(url);
  return json.decode(response.body);
}
}