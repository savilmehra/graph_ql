import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:graph_ql/features/products/model/products_response.dart';

import '../../../config/graphql/graph_ql_service.dart';

import '../../../config/graphql/graphql_client_service.dart';
import 'product_quries.dart';

class ProductService extends GraphQlService< ProductResponse> {
  final RequestType type;
  final Map<String, String>? header;
  final String? token;
  ProductService({required this.type,this.header,this.token})
      : super(
            baseUrl: '${DOMAIN_NAME}/graphql',
            header: header,
            token: token,
            query:token == null?products() :searchQuery( "pen"),
            requestType: type);

  @override
  ProductResponse parseResponse(Map<String, dynamic> jsonResponse) {
    return ProductResponse.fromJson(jsonResponse);
  }
}
