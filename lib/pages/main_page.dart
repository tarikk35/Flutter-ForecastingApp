import 'package:flutter/material.dart';

import '../widgets/opaque_appbar.dart';
import '../widgets/fading_blue_container.dart';
import 'package:climatic/helpers/fetcher.dart';
import 'package:climatic/widgets/weather_card.dart';
import 'package:climatic/utils/device_size.dart';
import 'package:climatic/utils/utils.dart' as util;

class MainPage extends StatefulWidget {
  final String city;
  MainPage({this.city});
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final _deviceInfo = DeviceInfo(context: context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadingBlueBGC(),
          OpaqueAppBar(),
          Positioned(
            top: _deviceInfo.height / 7 * 2,
            left: _deviceInfo.width / 20,
            right: _deviceInfo.width / 20,
            child: WeatherCard(
              weather: Fetcher().getWeather(
                  widget.city.isEmpty ? util.defaultCity : widget.city),
              deviceInfo: _deviceInfo,
            ),
          ),
        ],
      ),
    );
  }
}
