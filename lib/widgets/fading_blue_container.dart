import 'package:flutter/material.dart';

class FadingBlueBGC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/fadingblue.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
