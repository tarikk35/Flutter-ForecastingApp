import 'package:flutter/material.dart';

import 'pages/main_page.dart';
import 'pages/city_page.dart';
// °C

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CityPage(),
      routes: {
        '/weather': (context) => MainPage(),
        '/city': (context) => CityPage(),
      },
    );
  }
}
