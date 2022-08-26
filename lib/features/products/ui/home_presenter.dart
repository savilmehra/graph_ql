import 'dart:async';

import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import '../bloc/country_bloc.dart';
import '../model/country_vm.dart';
import 'home_page.dart';

class HomePresenter extends Presenter<CountryBloc, CountryVm, HomePage> {
  @override
  Stream<CountryVm> getViewModelStream(CountryBloc bloc) {
    return bloc.countryVmPipe.receive;
  }

  @override
  HomePage buildScreen(
    BuildContext context,
    CountryBloc bloc,
    CountryVm viewModel,
  ) {
    return HomePage(
      viewModel: viewModel,

    );
  }
}
