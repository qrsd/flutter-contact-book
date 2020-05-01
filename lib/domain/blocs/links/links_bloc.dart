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
    } else if (event is LinksPostEvent) {
      yield* _mapLinksPostEventToState(event);
    }
  }

  Stream<LinksState> _mapLinksLoadEventToState(LinksLoadEvent event) async* {
    yield LinksLoading();
    try {
      final links = await linkRepositoryImpl.getLinks(event.nodeCode);
      if (links.length == 0) {
        yield LinksNotLoaded();
      } else {
        yield LinksLoaded(links.map(Link.fromEntity).toList(), event.nodeCode);
      }
    } on Exception catch (e) {
      print(e);
      yield LinksNotLoaded();
    }
  }

  Stream<LinksState> _mapLinksPostEventToState(LinksPostEvent event) async* {
    try {
      var postMessage = '''
{"nodeid": "ABC123","version":2,"attributes":[{"field":"Names.name.node.lastname","id":"1539731886","value":"${event.surName}"},{"field":"Names.name.node.firstname","id":"4731886","value":"${event.firstName}"},{"field":"Names.name.node.dob","id":"1539731886","value":"${event.birthday}"},{"field":"Calling.mobile.node.mobilenumber","id":"53973541386","value":"${event.email}"},{"field":"thisisme.password","id":"5","value":"${event.password}"},{"field":"Names.name.node.gender","id":"1539731886","value":"${event.gender}"},''';
      await linkRepositoryImpl.postLink(postMessage);
    } on Exception catch (e) {
      print(e);
    }
    yield LinksPosted();
  }
}
