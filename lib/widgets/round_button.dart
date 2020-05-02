import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  static const Color _defaultColor = Color(0xFFe0e0e0);
  static const Color _defaultTextColor = Color(0xDD000000);
  final VoidCallback _onPressed;
  final String _text;
  final double _paddingAll;
  final Color _color;
  final Color _textColor;

  RoundButton(
      {Key key,
      VoidCallback onPressed,
      String text,
      double paddingAll = 8,
      Color color = _defaultColor,
      Color textColor = _defaultTextColor})
      : _onPressed = onPressed,
        _text = text,
        _paddingAll = paddingAll,
        _color = color,
        _textColor = textColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this._paddingAll),
      child: RaisedButton(
        color: _color,
        textColor: _textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: _onPressed,
        child: Text(_text),
      ),
    );
  }
}
