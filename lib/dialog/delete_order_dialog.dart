import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/entities/portfolio.dart';

class DeleteOrderDialog extends StatelessWidget {
  final PortfolioEntity portfolio;
  final Orders order;

  const DeleteOrderDialog(this.portfolio, this.order);

  @override
  Widget build(BuildContext context) {
    var simpleDialog = AlertDialog(
      title: Text('Delete Order ${this.order.symbol}'),
      content: Text("Delete order from history of portfolio ${portfolio.name}."),
      actions: <Widget>[
        FlatButton(
          child: Text("Delete"),
          onPressed: () {
            BlocProvider.of<PortfolioBloc>(context).add(PortfolioEventDeleteOrder(portfolio, order));
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
