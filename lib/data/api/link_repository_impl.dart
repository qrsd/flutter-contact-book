import '../../domain/repositories/link_repository.dart';
import '../entities/link_entity.dart';
import './api.dart';

/// Implementation of link repository. Calls endpoint on postman server
class LinkRepositoryImpl implements LinkRepository {
  /// [apiClient] passed in to avoid creating multiple instances
  final ApiClient apiClient;

  /// Constructor
  LinkRepositoryImpl({this.apiClient});

  @override
  Future<dynamic> getLinks(String nodeCode) async {
    final url =
        'https://dcqvf74krh.execute-api.us-east-1.amazonaws.com/production/links?originatorid=$nodeCode';
    final key = 'cNhuLQvdj18hYA6K0hSq59VIOvwNpcc7kTUfePJ6';
    final json = await apiClient.getData(url, key);
    final links = (json['links']).map(LinkEntity.fromJson).toList();

    return links;
  }
}
