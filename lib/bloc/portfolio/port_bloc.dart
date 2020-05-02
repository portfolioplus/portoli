import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/bloc/portfolio/port_state.dart';
import 'package:portoli/constants/settings.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:portoli/utils/globals.dart' as globals;
import 'package:portoli/utils/logging.dart';
import 'package:preferences/preferences.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final portfolioCollection = Firestore.instance.collection('portfolios');

  @override
  PortfolioState get initialState => PortfolioStateLoading();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is PortfolioEventLoad) {
      try {
        bool isAutoSync = PrefService.getBool(SET_SYNC);
        List<PortfolioEntity> ports = PortfolioEntity.load();
        if (ports.isEmpty && globals.uid != null) {
          var portDocument = await Firestore.instance
              .collection('portfolios')
              .document(globals.uid)
              .get();
          if (portDocument.exists) {
            ports = portDocument.data['items']
                .map<PortfolioEntity>((port) => PortfolioEntity.fromJson(port))
                .toList();
          }
        } else if (isAutoSync && globals.uid != null) {
          var portsToSave = ports
              .where((port) => !port.isPrivate)
              .map((port) => port.toDocument())
              .toList();
          var hash = ports
              .where((port) => !port.isPrivate)
              .map((port) => port.toJson().toString())
              .fold("", (x, y) => x + y);
          hash = base64.encode(utf8.encode(hash));
          if (portsToSave.length > 0) {
            try {
              var documentRef = await Firestore.instance
                  .collection('portfolios')
                  .document(globals.uid);
              var document = await documentRef.get();
              if (!document.exists ||
                  !document.data.containsKey('hash') ||
                  document.data['hash'] != hash) {
                documentRef.setData({'items': portsToSave, 'hash': hash});
              }
            } catch (e) {
              getLogger('uploadPortfolios')
                  .w("Portfolio upload failed. ${e.toString()}");
            }
          }
        }
        // refresh prices
        Stream<List<QuerySnapshot>> prices = _updatePrices(ports);
        if (prices != null) {
          prices.listen((s) {
            var stockItems = s
                .map((snap) => snap.documents
                    .map((doc) => StockEntity.fromSnapshot(doc))
                    .toList())
                .expand((i) => i)
                .toList();
            ports.forEach((portfolio) {
              portfolio.updatePrices(stockItems);
              PortfolioEntity.save(portfolio);
            });

            add(
              PortfolioEventLoaded(ports),
            );
          });
        } else {
          add(
            PortfolioEventLoaded(ports),
          );
        }
      } catch (e) {
        getLogger('loadPortfolios').w("Portfolio load failed. ${e.toString()}");
        yield PortfolioStateNotLoaded();
      }
    } else if (event is PortfolioEventLoaded) {
      yield PortfolioStateLoaded(event.items);
    } else if (event is PortfolioEventDeleteItem) {
      PortfolioEntity.delete(event.item);
      add(
        PortfolioEventLoad(),
      );
    } else if (event is PortfolioEventDeleteOrder) {
      event.portfolio.orders.remove(event.order);
      PortfolioEntity.delete(event.portfolio);
      PortfolioEntity.save(event.portfolio);
      add(
        PortfolioEventLoad(),
      );
    } else if (event is PortfolioEventDeleteDividend) {
      event.portfolio.dividends.remove(event.dividend);
      PortfolioEntity.delete(event.portfolio);
      PortfolioEntity.save(event.portfolio);
      add(
        PortfolioEventLoad(),
      );
    } else if (event is PortfolioEventAddOrder) {
      event.portfolio.orders.add(event.order);
      PortfolioEntity.save(event.portfolio);
      add(
        PortfolioEventLoad(),
      );
    } else if (event is PortfolioEventAddDividend) {
      event.portfolio.dividends.add(event.dividend);
      PortfolioEntity.save(event.portfolio);
      add(
        PortfolioEventLoad(),
      );
    }
  }

  Stream<List<QuerySnapshot>> _updatePrices(List<PortfolioEntity> ports) {
    Query query = Firestore.instance.collection('stocks');
    var names = ports.expand((p) => p.orders).map((o) => o.name).toSet();
    var queries = names
        .map((n) => query.where('name', isEqualTo: n).snapshots())
        .toList();
    if (queries.length == 0) {
      return null;
    }
    return StreamZip(queries);
  }
}

class PortfolioOrderBloc extends PortfolioBloc {
  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is PortfolioEventSelect) {
      yield PortfolioStateSelect(event.item);
    } else {
      yield* super.mapEventToState(event);
    }
  }
}

class PortfolioAddBloc extends Bloc<PortfolioEvent, PortfolioState> {
  @override
  PortfolioState get initialState => PortfolioStateLoading();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is PortfolioEventSave) {
      if (event.name.isEmpty) {
        yield PortfolioStateSaveErrName();
        yield PortfolioStateSaveErrNameReset();
      } else {
        List<PortfolioEntity> portfolios = PortfolioEntity.load();
        bool nameExists =
            portfolios.fold(false, (t, e) => t || e.name == event.name);
        if (nameExists) {
          yield PortfolioStateSaveErrNameDuplicate();
          yield PortfolioStateSaveErrNameReset();
        } else {
          PortfolioEntity item = PortfolioEntity(
              '', event.name, event.description, event.isPrivate, [], []);
          PortfolioEntity.save(item);
          yield PortfolioStateSave();
        }
      }
    } else if (event is PortfolioEvenSaveBack) {
      yield PortfolioStateSaveBack();
    }
  }
}

class PortfolioDividendBloc extends Bloc<PortfolioEvent, PortfolioState> {
  @override
  PortfolioState get initialState => PortfolioStatePieChart();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is PortfolioEventBarChart) {
      yield PortfolioStateBarChart();
    } else if (event is PortfolioEventBarChartYear) {
      yield PortfolioStateBarChartYear();
    } else if (event is PortfolioEventPieChart) {
      yield PortfolioStatePieChart();
    }
  }
}

class PortfolioDiversificationBloc
    extends Bloc<PortfolioEvent, PortfolioState> {
  @override
  PortfolioState get initialState => PortfolioStateCountryChart();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is PortfolioEventIndexChart) {
      yield PortfolioStateIndexChart();
    } else if (event is PortfolioEventIndustryChart) {
      yield PortfolioStateIndustryChart();
    } else if (event is PortfolioEventCountryChart) {
      yield PortfolioStateCountryChart();
    }
  }
}
