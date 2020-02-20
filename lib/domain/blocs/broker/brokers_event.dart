import 'package:equatable/equatable.dart';

/// Abstract of brokers events.
abstract class BrokersEvent extends Equatable {
  /// Constructor
  const BrokersEvent();

  @override
  List<Object> get props => [];
}

/// Event fires when brokers are being loaded.
class BrokersLoadEvent extends BrokersEvent {
  /// [nodeCode] is the originator of the broker call
  final String nodeCode;

  /// [destinationId] is the destination [nodeCode] is requesting
  final String destinationId;

  /// Constructor
  BrokersLoadEvent(this.nodeCode, this.destinationId);

  @override
  List<Object> get props => [nodeCode];
}
