import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:graph_ql/features/products/model/products_response.dart';

import '../../../config/graphql/graph_ql_service.dart';

import '../../../config/graphql/graphql_client_service.dart';
import '../model/cart_response.dart';
import 'cart_quries.dart';

class CartService extends GraphQlService<JsonRequestModel, CartResponse> {
  final RequestType type;

  final String cartId;

  CartService({required this.type, required this.cartId})
      : super(
            baseUrl: '${DOMAIN_NAME}/graphql',
            query: getCartDetailsQuery(cartId),
            requestType: type);

  @override
  CartResponse parseResponse(Map<String, dynamic> jsonResponse) {
    return CartResponse.fromJson(jsonResponse);
  }
}
