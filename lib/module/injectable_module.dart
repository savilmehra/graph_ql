
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  GraphQLClient get client => graphQLClient();
}

GraphQLClient graphQLClient() {
  final HttpLink httpLink = HttpLink(
    'https://demo.saleor.io/graphql/',
  );

  return GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: httpLink,
  );
}
