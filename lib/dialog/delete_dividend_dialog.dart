import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/entities/portfolio.dart';

class DeleteDividendDialog extends StatelessWidget {
  final PortfolioEntity portfolio;
  final Dividend order;

  const DeleteDividendDialog(this.portfolio, this.order);

  @override
  Widget build(BuildContext context) {
    var simpleDialog = AlertDialog(
      title: Text('Delete Dividend ${this.order.symbol}'),
      content: Text("Delete dividend from history of portfolio ${portfolio.name}."),
      actions: <Widget>[
        FlatButton(
          child: Text("Delete"),
          onPressed: () {
            BlocProvider.of<PortfolioBloc>(context).add(PortfolioEventDeleteDividend(portfolio, order));
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
