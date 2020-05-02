import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey.shade300,
        height: 120.0, // height of the button
        width: 120.0, // width of the button
        child: Center(
          child: Text(
            'No Data',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
