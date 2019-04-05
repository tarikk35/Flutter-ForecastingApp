import 'package:flutter/material.dart';

import '../widgets/opaque_appbar.dart';
import '../widgets/fading_blue_container.dart';
import 'package:climatic/models/weather_model.dart';

class MainPage extends StatefulWidget {
  final Weather _weather;
  MainPage(this._weather);
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadingBlueBGC(),
          OpaqueAppBar(),
        ],
      ),
    );
  }
}
