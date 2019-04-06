import 'package:flutter/material.dart';

class FadingBlueBGC extends StatelessWidget {
  final Widget child;
  FadingBlueBGC({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan.shade200, Colors.cyanAccent.shade200],
        ),
      ),
      child: child,
    );
  }
}
