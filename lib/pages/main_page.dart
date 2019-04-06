import 'package:flutter/material.dart';

import '../widgets/opaque_appbar.dart';
import '../widgets/fading_blue_container.dart';
import 'package:climatic/helpers/weather_json.dart';
import 'package:climatic/helpers/modelizer.dart';
import 'package:climatic/models/weather_model.dart';
import 'package:climatic/utils/device_size.dart';
import 'package:climatic/helpers/icon_url.dart';

class MainPage extends StatefulWidget {
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
            top: _deviceInfo.height / 7*2,
            left: _deviceInfo.width/20,
            right: _deviceInfo.width/20,
            child: updateTempWidget('Izmir'),
          ),
        ],
      ),
    );
  }
}

Widget updateTempWidget(city) {
  return FutureBuilder(
    future: WeatherJson().getWeather(city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      final _deviceInfo = DeviceInfo(context: context);

      if (snapshot.hasData) {
        final Weather _weather = Modelize(json: snapshot.data).getWeather();
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white54),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade300.withOpacity(0.3),
                Colors.blue.withOpacity(0.3),
                Colors.blue.shade300.withOpacity(0.3),
              ],
            ),
          ),
          height: _deviceInfo.height / 6 * 4,
          width: _deviceInfo.width*10/11,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _weather.temperature.toString(),
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}
