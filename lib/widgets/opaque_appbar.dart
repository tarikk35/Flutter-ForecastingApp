import 'package:flutter/material.dart';
import '../utils/device_size.dart';

class OpaqueAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      titleSpacing: DeviceInfo(context: context).width / 6,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.expand_more,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/city');
          },
        ),
        SizedBox(
          width: 40,
        ),
      ],
    );
  }
}
