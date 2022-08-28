import 'dart:convert';
import 'dart:developer';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';


import 'package:injectable/injectable.dart';

import 'graphql_client_service.dart';

abstract class GraphQlService<R extends JsonRequestModel,
    S extends JsonResponseModel> implements Service<R, S> {
  final String query;


  late GraphQLClientService service;

  GraphQlService({

    required this.query,
  }) {
    service = GraphQLClientService();
  }

  @override
  Future<Either<ServiceFailure, S>> request({R? requestModel}) async {
    if (await Locator().connectivity.getConnectivityStatus() ==
        ConnectivityStatus.offline) {
      Locator().logger.debug('JsonService response no connectivity error');
      return Left(NoConnectivityServiceFailure());
    }

    Map<String, dynamic> requestJson = const {};
    if (requestModel != null) {
      requestJson = requestModel.toJson();
      if (!isRequestModelJsonValid(requestJson)) {
        Locator().logger.debug('JsonService response invalid request error');
        return Left(GeneralServiceFailure());
      }
    }

    final result = await service.performQuery(query);
    S model;
    try {
      final content =jsonEncode(result.data);

      final Map<String, dynamic> jsonResponse =
          (content.isEmpty) ? {} : json.decode(content) ?? <String, dynamic>{};
      model = parseResponse(jsonResponse);
      return Right(model);
    } on Exception catch (e) {
      Locator()
          .logger
          .error('JsonService response parse exception', e.toString());
    }
    return Left(GeneralServiceFailure());
  }

  bool isRequestModelJsonValid(Map<String, dynamic> json) {
    try {
      if (json.isEmpty || _jsonContainsNull(json)) return false;
    } catch (e) {
      return false;
    }
    return true;
  }

  bool _jsonContainsNull(Map<String, dynamic> json) {
    bool containsNull = false;
    List values = json.values.toList();
    for (int i = 0; i < values.length; i++) {
      if (values[i] is Map)
        containsNull = _jsonContainsNull(values[i]);
      else if (values[i] == null) containsNull = true;
      if (containsNull) break;
    }
    return containsNull;
  }

  S parseResponse(Map<String, dynamic> jsonResponse);

  ServiceFailure onError(
      RestResponseType responseType, Map<String, dynamic> jsonResponse) {
    return GeneralServiceFailure();
  }
}
