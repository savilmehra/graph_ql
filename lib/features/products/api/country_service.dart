
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:graph_ql/features/products/model/products_response.dart';

import '../../../config/graphql/graph_ql_service.dart';



import 'product_quries.dart';


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
