import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../data/api/link_repository_impl.dart';
import '../../models/link.dart';
import './bloc.dart';

/// Links BLoC calls the api for all links, receives the entities,
/// converts them to models, and causes rebuilds based on state yields
class LinksBloc extends Bloc<LinksEvent, LinksState> {
  /// Requires link repository implementation to make the calls for all
  /// links associated with nodeCode.
  final LinkRepositoryImpl linkRepositoryImpl;

  /// Constructor
  LinksBloc({this.linkRepositoryImpl});

  @override
  LinksState get initialState => LinksLoading();

  @override
  Stream<LinksState> mapEventToState(
    LinksEvent event,
  ) async* {
    if (event is LinksLoadEvent) {
      yield* _mapLinksLoadEventToState(event);
    }
  }

  Stream<LinksState> _mapLinksLoadEventToState(LinksLoadEvent event) async* {
    try {
      final links = await linkRepositoryImpl.getLinks(event.nodeCode);
      yield LinksLoaded(links.map(Link.fromEntity).toList());
    } on Exception catch (e) {
      print(e);
      yield LinksNotLoaded();
    }
  }
}
