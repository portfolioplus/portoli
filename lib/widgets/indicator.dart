import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  final GestureTapCallback onTapIndicator;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.onTapIndicator,
    this.size = 16,
    this.textColor = const Color(0xffffffff),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onTapIndicator,
        color: color,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        ));
  }
}
