import 'dart:convert';
import 'dart:developer';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:injectable/injectable.dart';

import 'graphql_client_service.dart';

enum RequestType { query, mutation }

abstract class GraphQlService<S extends JsonResponseModel>
    implements ServiceGQL {
  final String query;
  final RequestType requestType;
  final String baseUrl;
  final String? token;
  final Map<String, String>? header;
  late GraphQLClientService service;

  GraphQlService({
    required this.query,
    required this.baseUrl,
    this.token,
    this.header,
    required this.requestType,
  }) {
    service = GraphQLClientService(baseUrl: baseUrl, token: token);
  }

  @override
  Future<Either<ServiceFailure, S>> request() async {
    if (await Locator().connectivity.getConnectivityStatus() ==
        ConnectivityStatus.offline) {
      Locator().logger.debug('JsonService response no connectivity error');
      return Left(NoConnectivityServiceFailure());
    }

    S model;
    String content = "";
    switch (requestType) {
      case RequestType.query:
        {
          final result = await service.performQuery(query);
          content = jsonEncode(result.data);
        }
        break;

      case RequestType.mutation:
        {
          final result = await service.performMutation(query);
          content = jsonEncode(result.data);
        }
    }

    try {
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

abstract class ServiceGQL {
  Future<void> request();
}
