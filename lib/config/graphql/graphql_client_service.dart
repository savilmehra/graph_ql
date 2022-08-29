import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

const String DOMAIN_NAME = "https://mcstaging4.fnac.qa";
const String BASE_URL_GET = "$DOMAIN_NAME/graphql?query=";
const String MUTATION = "$DOMAIN_NAME/graphql";
class GraphQLClientService {
  late GraphQLClient _client;

  GraphQLClientService({required String baseUrl}) {
    var link;
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer krxrov9y2odsheczd6f35j0gnyfxhgsr',
    );
    final HttpLink _httpLink = HttpLink(baseUrl,
        defaultHeaders: <String, String>{'Store': 'english'});


    link = authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );
  }

  Future<QueryResult> performQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final options = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );
    QueryResult? result = await _client.query(options);
    // log(jsonEncode(result.data));
    return result;
  }



  Future<QueryResult> performMutation(
      String query, {
        Map<String, dynamic>? variables,
      }) async {
    log(query);
    final options = MutationOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );
    QueryResult? result = await _client.mutate(options);
    // log(jsonEncode(result.data));
    return result;
  }




  Future<dynamic> get(String url,
      {required Map<String, String> headers}) async {
    url = url.replaceAll("\n", " ");
    final response = await http.get(
      Uri.parse(BASE_URL_GET + url),
      headers: <String, String>{'Store': 'english'},
    );
    return json.decode(utf8.decode(response.bodyBytes));
  }
}
