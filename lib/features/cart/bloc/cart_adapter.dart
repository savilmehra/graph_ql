import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:injectable/injectable.dart';

import '../../../config/graphql/graph_ql_service.dart';
import '../../../config/graphql/graph_ql_service_adapter.dart';
import '../model/cart_response.dart';

import '../api/cart_service.dart';
import '../model/cart_entity.dart';

@injectable
class CartAdapter
    extends ServiceAdapterGraphQl<CartEntity, CartResponse, CartService> {
  final String? token;
  final RequestType requestType;
  final Map<String, String>? header;

  CartAdapter(this.requestType, this.token, this.header)
      : super(CartService(
            token: token,
            header: header,
            type: requestType,
            cartId: '7hdnYowNelFXS0M8LTqegy0863PzQ12u'));

  @override
  CartEntity createEntity(
      CartEntity initialEntity, CartResponse responseModel) {
    return initialEntity.merge(
      d: responseModel,
    );
  }
}
