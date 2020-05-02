import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color colorIcon;
  final Color colorBackground;

  const RoundIconButton({Key key, this.icon, this.onPressed, this.colorIcon, this.colorBackground}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: FlatButton(
        child: Icon(
          this.icon,
          size: 25,
          color: this.colorIcon,
        ),
        onPressed: this.onPressed,
        color: this.colorBackground,
        shape: CircleBorder(
        ),
      ),
    );
  }
}