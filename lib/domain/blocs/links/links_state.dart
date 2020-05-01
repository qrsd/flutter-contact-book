import 'package:equatable/equatable.dart';

/// Abstract of links state.
abstract class LinksState extends Equatable {
  /// Constructor
  const LinksState();

  @override
  List<Object> get props => [];
}

/// State yielded while links are being loaded.
class LinksLoading extends LinksState {}

/// State yields a list of [links] on success of loading.
class LinksLoaded extends LinksState {
  /// [links] is a list of all loaded links.
  final List<dynamic> links;

  /// [requester] is the node requesting all its links.
  final String requester;

  /// Constructor
  LinksLoaded(this.links, this.requester);

  @override
  List<Object> get props => [links];
}

/// State yielded after POST
class LinksPosted extends LinksState {}

/// State yielded while links are being loaded.
class LinksNotLoaded extends LinksState {}
