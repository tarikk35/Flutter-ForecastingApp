import 'package:flutter/material.dart';

class DeviceInfo {
  final context;
  final width;
  final height;
  DeviceInfo({this.context})
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
}
