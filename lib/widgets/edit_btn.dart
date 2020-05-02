import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final String _text;
  final VoidCallback _onPressed;
  final MainAxisSize _mainAxisSize;
  const EditButton({Key key, text, onPressed, mainAxisSize = MainAxisSize.max})
      : _onPressed = onPressed,
        _text = text,
        _mainAxisSize = mainAxisSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50, left: 50),
      child: FlatButton(
        color: Colors.grey[300],
        onPressed: _onPressed,
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: _mainAxisSize,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    _text,
                    style: TextStyle(color: Colors.grey),
                  )),
              Row(
                  mainAxisSize: _mainAxisSize,
                  children: <Widget>[
                    VerticalDivider(
                      thickness: 0.8,
                    ),
                    Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.black54,
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
