import 'package:flutter/material.dart';

double deviceWidth;

class MarginText extends StatelessWidget {
  final EdgeInsets margin;
  final String text;
  final textStyle style;
  MarginText({this.margin, this.text, this.style});

  TextStyle getTextStyle(textStyle style) {
    if (style == textStyle.light) {
      return TextStyle(
          color: Colors.white70,
          fontSize: 33,
          fontWeight: FontWeight.w300,
          fontFamily: 'Caviar');
    } else if (style == textStyle.medium) {
      return TextStyle(
        color: Colors.white70,
        fontSize: 44,
        fontWeight: FontWeight.w300,
      );
    } else {
      return TextStyle(
        color: Colors.white,
        fontSize: deviceWidth /text.length-2,
        fontWeight: FontWeight.w500,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: margin,
      child: Text(
        text,
        style: getTextStyle(style),
      ),
    );
  }
}

enum textStyle { light, medium, heavy }
