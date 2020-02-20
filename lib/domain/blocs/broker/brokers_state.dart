import 'package:equatable/equatable.dart';

/// Abstract of brokers state.
abstract class BrokersState extends Equatable {
  /// Constructor
  const BrokersState();

  @override
  List<Object> get props => [];
}

/// State yielded while brokers are being loaded.
class BrokersLoading extends BrokersState {}

/// State yields a [broker] on success
class BrokersLoaded extends BrokersState {
  /// [broker] contains all link information.
  final dynamic broker;

  /// Constructor
  BrokersLoaded(this.broker);

  @override
  List<Object> get props => [broker];
}

/// State yielded while brokers are being loaded.
class BrokersNotLoaded extends BrokersState {}
