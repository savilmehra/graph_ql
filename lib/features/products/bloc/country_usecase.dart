import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';

import '../../../locator_gl.dart';
import '../api/country_api_response.dart';
import '../model/country_entity.dart';
import '../model/country_vm.dart';
import 'country_serviece_adapter.dart';


class CountryUseCase extends UseCase {


  late final ViewModelCallback<CountryVm> _viewModelCallBack;
  CountryUseCase(      ViewModelCallback<CountryVm> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;
 var scope;
  void execute() async {
    scope = LocatorMain()
        .repository
        .create<CountryEntity>(CountryEntity(), _notifySubscribers);

    await LocatorMain()
        .repository
        .runServiceAdapter(scope, CountryServiceAdapter());
  }

  void _notifySubscribers(entity) {
    entity= LocatorMain()
        .repository.get(scope);

    if (kDebugMode) {
      print("notify");
    }

    _viewModelCallBack(buildViewModel(entity));
  }

  CountryVm buildViewModel(CountryEntity entity) {

    if (kDebugMode) {
      print("viewmodel build");
    }
    return CountryVm(
      data: entity.data,

    );
  }
}
