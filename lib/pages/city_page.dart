import 'package:flutter/material.dart';

import 'package:climatic/widgets/fading_blue_container.dart';
import 'package:climatic/utils/device_size.dart';
import 'package:climatic/widgets/bordered_gradient_button.dart';
import 'package:climatic/pages/main_page.dart';
import 'package:climatic/utils/utils.dart';

class CityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CityPageState();
  }
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    final _deviceInfo = DeviceInfo(context: context);
    final _controller = TextEditingController();

    void route() {
      final route = MaterialPageRoute(builder: (BuildContext context) {
        return MainPage(
          city: _controller.text.isNotEmpty
              ? _controller.text[0].toUpperCase() +
                  _controller.text.substring(1)
              : defaultCity,
        );
      });
      Navigator.of(context).pushReplacement(route);
    }

    return Scaffold(
      body: FadingBlueBGC(
        child: Container(
          margin: EdgeInsets.only(
              top: _deviceInfo.height / 7,
              left: _deviceInfo.width / 12,
              right: _deviceInfo.width / 12),
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (value) {
                  route();
                },
                controller: _controller,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_city,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  labelText: 'City',
                ),
              ),
              SizedBox(
                height: _deviceInfo.height / 9,
              ),
              BorderedGradientButton(
                function: route,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
