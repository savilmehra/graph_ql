
import 'package:graphql/client.dart';


class GraphQLClientService {
  late  GraphQLClient _client;

  GraphQLClientService() {
    final HttpLink httpLink = HttpLink(

      'https://demo.saleor.io/graphql/',
      useGETForQueries: true,
    );
    _client =  GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
    );
  }
  String? typenameDataIdFromObject(Object object) {
    if (object is Map<String, Object> &&
        object.containsKey('__typename') &&
        object.containsKey('id')) {
      return "${object['__typename']}/${object['id']}";
    }
    return null;
  }
  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> ?variables,}) async {
    final options = WatchQueryOptions(
      document: gql(query),
      variables:  variables??{},
      fetchResults: true,
    );

    print(query);
    print(variables);
    final result = await _client.query(options);
    print(result);
    return result;
  }


}
