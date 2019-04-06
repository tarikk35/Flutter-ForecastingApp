import 'package:flutter/material.dart';

import 'package:climatic/utils/device_size.dart';
import 'package:climatic/models/weather.dart';
import 'package:climatic/widgets/network_icon.dart';
import 'package:climatic/widgets/margin_text.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          NetworkIcon(
                            iconUrl: snapshot.data.iconUrl,
                          ),
                          MarginText(
                            margin:
                                EdgeInsets.only(left: deviceInfo.width / 20,top: deviceInfo.height/15),
                            style: textStyle.heavy,
                            text:
                                '${snapshot.data.city.cityName} , ${snapshot.data.city.country}',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: deviceInfo.width / 16,
                                top: deviceInfo.height / 30),
                            child: Icon(
                              Icons.whatshot,
                              color: Colors.white70,
                              size: 44,
                            ),
                          ),
                          MarginText(
                            margin: EdgeInsets.only(
                                left: deviceInfo.width / 8,
                                top: deviceInfo.height / 30),
                            text:
                                '${snapshot.data.temperature.toStringAsFixed(1)} °C',
                            style: textStyle.medium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MarginText(
                            margin: EdgeInsets.only(
                                left: deviceInfo.width / 16,
                                top: deviceInfo.height / 25),
                            text: 'psi',
                            style: textStyle.light,
                          ),
                          MarginText(
                            margin: EdgeInsets.only(
                                left: deviceInfo.width / 8,
                                top: deviceInfo.height / 25),
                            text:
                                '${(snapshot.data.pressure / 1000).toStringAsFixed(3)}',
                            style: textStyle.medium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: deviceInfo.width / 16,
                                top: deviceInfo.height / 20),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white70,
                              size: 44,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: deviceInfo.width / 12),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '     ${snapshot.data.windSpeed.toStringAsFixed(1)}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 44,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  km/h',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
