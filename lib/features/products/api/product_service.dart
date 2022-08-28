
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:graph_ql/features/products/model/products_response.dart';

import '../../../config/graphql/graph_ql_service.dart';



import 'product_quries.dart';


class ProductService
    extends GraphQlService<JsonRequestModel, ProductResponse> {

  ProductService() : super( query: searchQuery());

  @override
  ProductResponse parseResponse(Map<String, dynamic> jsonResponse) {

    return ProductResponse.fromJson(jsonResponse);
  }
}
