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
    JsonRequestModel, ProductResponse, ProductService> {

  final RequestType requestType;
  ProductAdapter(this.requestType) : super(ProductService(type: requestType));

  @override
  ProductEntity createEntity(
      ProductEntity initialEntity, ProductResponse responseModel) {
    return initialEntity.merge(
      d: responseModel,
    );
  }
}
