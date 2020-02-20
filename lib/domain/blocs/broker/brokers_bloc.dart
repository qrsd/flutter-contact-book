import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../data/api/broker_repository_impl.dart';
import '../../models/broker.dart';
import './bloc.dart';

/// Brokers BLoC calls the api for a broker, receives the entity,
/// converts them to model, and causes rebuilds based on state yields
class BrokersBloc extends Bloc<BrokersEvent, BrokersState> {
  /// Requires broker repository implementation to make the calls to the api
  final BrokerRepositoryImpl brokerRepositoryImpl;

  /// Constructor
  BrokersBloc({this.brokerRepositoryImpl});

  @override
  BrokersState get initialState => BrokersLoading();

  @override
  Stream<BrokersState> mapEventToState(
    BrokersEvent event,
  ) async* {
    if (event is BrokersLoadEvent) {
      yield* _mapBrokersLoadEventToState(event);
    }
  }

  Stream<BrokersState> _mapBrokersLoadEventToState(
      BrokersLoadEvent event) async* {
    try {
      final broker = await brokerRepositoryImpl.getBroker(
          event.nodeCode, event.destinationId);
      yield BrokersLoaded(Broker.fromEntity(broker));
    } on Exception catch (e) {
      print(e);
      yield BrokersNotLoaded();
    }
  }
}
