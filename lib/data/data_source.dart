import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

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
}