/// Repository  contract
abstract class BrokerRepository {
  /// Returns all information on [destinationID] associated
  /// with param [nodeCode]
  Future<dynamic> getBroker(String nodeCode, String destinationId);
}
