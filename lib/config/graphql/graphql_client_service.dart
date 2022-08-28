
import 'dart:convert';
import 'dart:developer';

import 'package:graphql/client.dart';

const String DOMAIN_NAME = "https://mcstaging4.fnac.qa";

class GraphQLClientService {
  late  GraphQLClient _client;

  GraphQLClientService() {

    var link;
    final AuthLink authLink = AuthLink(
      getToken: () async =>
      'Bearer zlyixrn0tqbhdox98pus03xrmbtefhgc',
    );
    final HttpLink _httpLink = HttpLink('${DOMAIN_NAME}/graphql',
        defaultHeaders: <String, String>{
        'Store':
        'english'
        });
    link = authLink.concat(_httpLink);

    _client =  GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );
  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> ?variables,}) async {
    final options = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );
    QueryResult? result = await _client.query(options);

   // log(jsonEncode(result.data));
    return result;
  }


}


