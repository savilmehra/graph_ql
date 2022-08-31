import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:injectable/injectable.dart';

import '../../../config/graphql/graph_ql_service.dart';
import '../../../config/graphql/graph_ql_service_adapter.dart';
import '../model/products_response.dart';

import '../api/product_service.dart';
import '../model/product_entity.dart';
@injectable
class ProductAdapter extends ServiceAdapterGraphQl<ProductEntity,
   ProductResponse, ProductService> {
  final Map<String, String>? header;
  final String? token;
  final RequestType requestType;
  ProductAdapter(this.requestType,this.token,this.header) : super(ProductService(type: requestType,token: token,header: header));

  @override
  ProductEntity createEntity(
      ProductEntity initialEntity, ProductResponse responseModel) {
    return initialEntity.merge(
      d: responseModel,
    );
  }
}
