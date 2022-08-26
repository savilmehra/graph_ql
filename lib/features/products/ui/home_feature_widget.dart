import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';

import '../bloc/country_bloc.dart';
import 'home_presenter.dart';

class HomeFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryBloc>(
      create: (_) => CountryBloc(),
      child: HomePresenter(),
    );
  }
}
