import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:graph_ql/config/graphql/graph_ql_service.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

const String DOMAIN_NAME = "https://mcstaging4.fnac.qa";
const String BASE_URL_GET = "$DOMAIN_NAME/graphql?query=";
const String MUTATION = "$DOMAIN_NAME/graphql";
class GraphQLClientService {
  late GraphQLClient _client;

  GraphQLClientService({required String baseUrl,required RequestType requestType}) {
    var link;
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer 4vuve1vw4gcf1b09u7gmzetz8vdkevua',
    );
    final HttpLink _httpLink = HttpLink(baseUrl,
        useGETForQueries:requestType==RequestType.get?true:false,
        defaultHeaders: <String, String>{'Store': 'english'});


    link =requestType==RequestType.get?_httpLink: authLink.concat(_httpLink);

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




}
