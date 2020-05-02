import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:portoli/bloc/stock/stock_event.dart';
import 'package:portoli/bloc/stock/stock_state.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portoli/entities/strategy_item.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StreamSubscription _itemsSubscription;

  Map _cache = {};

  @override
  Stream<StockState> mapEventToState(StockEvent event) async* {
    if (event is StockEventLoad) {
      yield* _mapLoadStrategyToState(event.strategyItem);
    } else if (event is StockEventLoaded) {
      yield* _mapLoadedStrategyToState(event);
    }
  }

  Stream<StockState> _mapLoadStrategyToState(
      StrategyEntity strategyItem) async* {
    try {
      _itemsSubscription?.cancel();
      if (_cache.containsKey(strategyItem.toHash())) {
        var filterdItems = _filter(_cache[strategyItem.toHash()]);
        add(
          StockEventLoaded(filterdItems),
        );
      } else {
        _itemsSubscription = _getStocks(strategyItem.toQuery()).listen(
          (strategyItems) {
            _cache[strategyItem.toHash()] = strategyItems;
            var filterdItems = _filter(strategyItems);
            add(
              StockEventLoaded(filterdItems),
            );
          },
        );
      }
    } catch (_) {
      yield StockStateNotLoaded();
    }
  }

  List<StockEntity> _filter(List<StockEntity> unfilterd) {
    Map _cou = Map.fromIterable(COUNTRIES,
        key: (item) => item, value: (item) => PrefService.getBool(item));
    Map _ind = Map.fromIterable(INDUSTRIES,
        key: (item) => item, value: (item) => PrefService.getBool(item));
    Map _idx = Map.fromIterable(INDICES,
        key: (item) => item, value: (item) => PrefService.getBool(item));
    var filterdItems = unfilterd
        .where((test) =>
            _cou[test.country] &&
            test.industries.fold(true, (value, item) => _ind[item] && value) &&
            test.indices.fold(true, (value, item) => _idx[item] && value))
        .toList();
    return filterdItems;
  }

  Stream<List<StockEntity>> _getStocks(Query myQuery) {
    return myQuery.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => StockEntity.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<StockState> _mapLoadedStrategyToState(StockEventLoaded event) async* {
    yield StockStateLoaded(event.items);
  }

  @override
  Future<void> close() {
    _itemsSubscription?.cancel();
    return super.close();
  }

  @override
  StockState get initialState => StockStateNotLoaded();
}

class StockViewBloc extends Bloc<StockEvent, StockState> {
  @override
  Stream<StockState> mapEventToState(StockEvent event) async* {
    if (event is StockEventCurrency) {
      yield StockStateCurrency(event.currency);
    }
  }

  @override
  StockState get initialState => StockStateCurrency(EUR);
}
