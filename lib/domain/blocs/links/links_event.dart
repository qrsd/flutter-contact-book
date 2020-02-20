import 'package:equatable/equatable.dart';

/// Abstract of links events.
abstract class LinksEvent extends Equatable {
  /// Constructor
  const LinksEvent();

  @override
  List<Object> get props => [];
}

/// Event fires when a link is requested.
class LinksLoadEvent extends LinksEvent {
  /// [nodeCode] used to find links
  final String nodeCode;

  /// Constructor
  LinksLoadEvent(this.nodeCode);

  @override
  List<Object> get props => [nodeCode];
}
