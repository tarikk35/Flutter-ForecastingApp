import 'package:flutter/material.dart';

import 'package:climatic/utils/device_size.dart';

class NetworkIcon extends StatelessWidget {
  final iconUrl;
  NetworkIcon({this.iconUrl});
  @override
  Widget build(BuildContext context) {
    final DeviceInfo deviceInfo = DeviceInfo(context: context);
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
          left: deviceInfo.width / 16, top: deviceInfo.height / 20),
      child: Image.network(
        iconUrl,
        height: deviceInfo.height / 6,
        width: deviceInfo.width / 3,
        fit: BoxFit.cover,
      ),
    );
  }
}
