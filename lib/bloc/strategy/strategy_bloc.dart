import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:portoli/bloc/strategy/strategy_event.dart';
import 'package:portoli/bloc/strategy/strategy_state.dart';
import 'package:portoli/constants/perf_keys.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StrategyBloc extends Bloc<StrategyEvent, StrategyState> {
  StreamSubscription _strategySubscription;
  final strategyCollection = Firestore.instance
      .collection('strategies')
      .where('enable', isEqualTo: true)
      .orderBy('icon.id');

  @override
  StrategyState get initialState => StrategyStateLoading();

  @override
  Stream<StrategyState> mapEventToState(StrategyEvent event) async* {
    if (event is StrategyEventLoad) {
      yield* _mapLoadStrategyToState();
    } else if (event is StrategyEventLoaded) {
      yield* _mapLoadedStrategyToState(event);
    }
  }

  Stream<StrategyState> _mapLoadStrategyToState() async* {
    try {
      _strategySubscription?.cancel();
      _strategySubscription = _getStrategies().listen(
        (strategyItems) {
          // save strategy items
          var allowedStrategies = strategyItems.map((f) {
            return f.filterName;
          }).toList();
          String portfoliosString = jsonEncode(allowedStrategies);
          PrefService.setString(ALLOWED_STRATEGIES_KEY, portfoliosString);
          add(
            StrategyEventLoaded(strategyItems),
          );
        },
      );
    } catch (_) {
      yield StrategyStateNotLoaded();
    }
  }

  Stream<List<StrategyEntity>> _getStrategies() {
    return strategyCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => StrategyEntity.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<StrategyState> _mapLoadedStrategyToState(
      StrategyEventLoaded event) async* {
    yield StrategyStateLoaded(event.strategyItems);
  }

  @override
  Future<void> close() {
    _strategySubscription?.cancel();
    return super.close();
  }
}
