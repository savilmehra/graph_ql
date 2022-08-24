import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:graph_ql/data/products_response.dart';
import 'package:graphql/client.dart';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@injectable
class DataSource {
  final GraphQLClient client;

  DataSource(this.client);

  Future<Map<String, dynamic>?> call({
    required String query,
    required int  first ,
    required String  channel,
  }) async {
    try {
      try {
        final options = WatchQueryOptions(
          document: gql(query),
          variables:  <String, dynamic>{
            'nfirst': first,
            'nchannel': channel,

          },
          fetchResults: true,
        );
        final result = await client.query(options);

        return result.data;
      } catch (e) {
        debugPrint(e.toString());
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw UnimplementedError();
    }
  }


  Future<String> fetchData({
    required int first,
    required String channel,
  }) async {



    final response =
    await http.get(Uri.parse('https://countries.trevorblades.com/?query={countries{name}}'));

    return response.body;
  }

}