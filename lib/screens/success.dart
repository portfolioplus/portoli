import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';

class SuccessView extends StatelessWidget {
  final NavEvent next;

  const SuccessView({Key key, this.next}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      BlocProvider.of<NavDrawerBloc>(context).add(next);
    });
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
