import 'package:equatable/equatable.dart';

import '../../data/entities/link_entity.dart';

/// Link models used by BLoC
class Link extends Equatable {
  /// [destinationID] of this link
  final String destinationID;

  /// [name] of this link
  final String name;

  /// [picture] of this link
  final String picture;

  /// Constructor
  const Link({this.destinationID, this.name, this.picture});

  @override
  List<Object> get props => [destinationID, name, picture];

  /// Converts model to entity
  LinkEntity toEntity() {
    return LinkEntity(
      destinationID: destinationID,
      name: name,
      picture: picture,
    );
  }

  /// Converts entity to model
  static Link fromEntity(dynamic entity) {
    return Link(
      destinationID: entity.destinationID,
      name: entity.name,
      picture: entity.picture,
    );
  }

  @override
  String toString() => 'Destination ID: $destinationID, Name: $name';
}
