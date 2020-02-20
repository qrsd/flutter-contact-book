import 'package:equatable/equatable.dart';

/// Broker entity used by BLoC
class BrokerEntity extends Equatable {
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
  const BrokerEntity(
      {this.name, this.phone, this.email, this.insta, this.destinationId});

  @override
  List<Object> get props => [name, phone, email, insta, destinationId];

  /// Creates a entity from json
  static BrokerEntity fromJson(dynamic json) {
    return BrokerEntity(
      name: json['name'] as String,
      phone: json['mobile'] as String,
      email: json['email'] as String,
      insta: '',
      destinationId: json['destinationId'] as String,
    );
  }

  @override
  String toString() => 'Name: $name, Phone: $phone, Email: $email '
      'DestinationID : $destinationId';
}
