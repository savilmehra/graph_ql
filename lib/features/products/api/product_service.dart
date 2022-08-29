import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:graph_ql/features/products/model/products_response.dart';

import '../../../config/graphql/graph_ql_service.dart';

import '../../../config/graphql/graphql_client_service.dart';
import 'product_quries.dart';

class ProductService extends GraphQlService<JsonRequestModel, ProductResponse> {
  final RequestType type;

  ProductService({required this.type})
      : super(
            baseUrl: '${DOMAIN_NAME}/graphql',
            query: searchQuery(type == RequestType.get
                ? "tv"
                : type == RequestType.query
                    ? "laptop"
                    : "pen"),
            requestType: type);

  @override
  ProductResponse parseResponse(Map<String, dynamic> jsonResponse) {
    return ProductResponse.fromJson(jsonResponse);
  }
}
