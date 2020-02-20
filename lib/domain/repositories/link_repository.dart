/// Repository  contract
abstract class LinkRepository {
  /// Returns all links associated with param [nodeCode]
  Future<dynamic> getLinks(String nodeCode);
}
