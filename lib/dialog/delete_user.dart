import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/utils/globals.dart' as globals;

class DeleteUserDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var simpleDialog = AlertDialog(
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: RichText(
        text: TextSpan(
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              background: Paint()
                ..strokeWidth = 25.0
                ..color = Colors.redAccent
                ..style = PaintingStyle.stroke
                ..strokeJoin = StrokeJoin.round),
          children: [
            WidgetSpan(
              child: Icon(Icons.warning, size: 30, color: Colors.white,),
            ),
            TextSpan(
              text: " Delete User account",
            ),
          ],
        ),
      ),),
      content: Text(
          "Delete user ${globals.username} and all portfolios. This operation can't undo."),
      actions: <Widget>[
        FlatButton(
          color: Colors.redAccent,
          child: Text("Delete"),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(Delete());
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    return simpleDialog;
  }
}
