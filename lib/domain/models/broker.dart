import 'package:equatable/equatable.dart';

import '../../data/entities/broker_entity.dart';

/// Broker models used by BLoC
class Broker extends Equatable {
  /// [name] of this Broker
  final String name;

  /// [phone] of this Broker
  final String phone;

  /// [email] of this Broker
  final String email;

  /// [insta] of this Broker
  final String insta;

  /// [destinationId] of this Broker
  final String destinationId;

  /// Constructor
  const Broker(
      {this.name, this.phone, this.email, this.insta, this.destinationId});

  @override
  List<Object> get props => [name, phone, email, insta, destinationId];

  /// Converts model to entity
  BrokerEntity toEntity() {
    return BrokerEntity(
      name: name,
      phone: phone,
      email: email,
      insta: insta,
      destinationId: destinationId,
    );
  }

  /// Converts entity to model
  static Broker fromEntity(dynamic entity) {
    return Broker(
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      insta: entity.insta,
      destinationId: entity.destinationId,
    );
  }

  @override
  String toString() => 'Name: $name, Phone: $phone, Email: $email, '
      'DestinationID : $destinationId';
}
