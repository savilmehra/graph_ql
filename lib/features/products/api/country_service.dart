import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:graph_ql/features/products/model/products_response.dart';

import 'package:injectable/injectable.dart';

import '../../../config/graphql/graph_ql_service.dart';



import 'product_quries.dart';
import '../../../locator_gl.dart';
import 'country_api_response.dart';

class CountryService
    extends GraphQlService<JsonRequestModel, ProdustsData> {


  CountryService() : super( query: productGraphQL, variables: <String, dynamic>{
    'nfirst': 15,
    'nchannel': "default-channel",

  });

  @override
  ProdustsData parseResponse(Map<String, dynamic> jsonResponse) {




    return ProdustsData.fromJson(jsonResponse);
  }
}
