import 'package:flutter/material.dart';

import 'package:climatic/utils/device_size.dart';
import 'package:climatic/models/weather.dart';
import 'package:climatic/widgets/network_icon.dart';

class WeatherCard extends StatelessWidget {
  final weather;
  final DeviceInfo deviceInfo;
  WeatherCard({this.weather, this.deviceInfo});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: weather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('enteredXXXXXX');
          return snapshot.data.hasError
              ? Text('An error occured.')
              : Container(
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
                  height: deviceInfo.height / 6 * 4,
                  width: deviceInfo.width / 10 * 11,
                  child: Column(
                    children: <Widget>[
                      NetworkIcon(iconUrl: snapshot.data.iconUrl),
                    ],
                  ),
                );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            alignment: Alignment.center, child: CircularProgressIndicator());
      },
    );
  }
}
