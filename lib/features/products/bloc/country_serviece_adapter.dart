import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:injectable/injectable.dart';

import '../../../config/graphql/graph_ql_service_adapter.dart';
import '../model/products_response.dart';
import '../api/country_api_response.dart';
import '../api/country_service.dart';
import '../model/country_entity.dart';
@injectable
class CountryServiceAdapter extends ServiceAdapterGraphQl<CountryEntity,
    JsonRequestModel, ProdustsData, CountryService> {
  CountryServiceAdapter() : super(CountryService());

  @override
  CountryEntity createEntity(
      CountryEntity initialEntity, ProdustsData responseModel) {
    return initialEntity.merge(
      d: responseModel,
    );
  }
}
