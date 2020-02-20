import 'package:equatable/equatable.dart';

/// Link models used by BLoC
class LinkEntity extends Equatable {
  /// [destinationID] of this link
  final String destinationID;

  /// [name] of this link
  final String name;

  /// [picture] of this link
  final String picture;

  /// Constructor
  const LinkEntity({this.destinationID, this.name, this.picture});

  @override
  List<Object> get props => [destinationID, name, picture];

  /// Creates a entity from json
  static LinkEntity fromJson(dynamic json) {
    return LinkEntity(
      destinationID: json['destinationid'] as String,
      name: json['name'] as String,
      picture: null,
    );
  }

  @override
  String toString() => 'Destination ID: $destinationID, Name: $name';
}
