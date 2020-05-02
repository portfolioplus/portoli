import 'package:flutter/material.dart';

class ChartButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ChartButton({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: OutlineButton(
        child: Icon(
          this.icon,
          size: 25,
          color: Colors.grey,
        ),
        onPressed: this.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}