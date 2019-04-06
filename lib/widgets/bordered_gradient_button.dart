import 'package:flutter/material.dart';

class BorderedGradientButton extends StatelessWidget {
  final Function function;
  BorderedGradientButton({this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black54),
          gradient: LinearGradient(colors: [
            Colors.blue.shade300.withOpacity(0.5),
            Colors.teal.shade300.withOpacity(0.6),
          ])),
      child: FlatButton(
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.w300,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onPressed: () {
            function();
          }),
    );
  }
}
