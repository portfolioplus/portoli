import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;
  final Color color;
  final double thickness;
  const DividerText({
    Key key,
    this.text,
    this.color,
    this.thickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            thickness: thickness,
            color: color,
          )),
          Text(text, style: TextStyle(color: color)),
          Expanded(
              child: Divider(
            thickness: thickness,
            color: color,
          )),
        ],
      ),
    );
  }
}
