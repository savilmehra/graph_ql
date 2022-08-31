import '../../../config/graphql/graph_ql_service.dart';

import '../../../config/graphql/graphql_client_service.dart';
import '../model/cart_response.dart';
import 'cart_quries.dart';

class CartService extends GraphQlService<CartResponse> {
  final RequestType type;

  final String cartId;

  final String? token;
  final Map<String, String>? header;

  CartService(
      {required this.type, required this.cartId, this.token, this.header})
      : super(
            baseUrl: '${DOMAIN_NAME}/graphql',
            token: token,
            header: header,
            query: getCartDetailsQuery(cartId),
            requestType: type);

  @override
  CartResponse parseResponse(Map<String, dynamic> jsonResponse) {
    return CartResponse.fromJson(jsonResponse);
  }
}
