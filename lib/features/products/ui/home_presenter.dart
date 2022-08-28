import 'dart:async';

import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import '../bloc/product_bloc.dart';
import '../model/product_vm.dart';
import 'home_page.dart';

class HomePresenter extends Presenter<ProductBloc, ProductViewModel, HomePage> {
  @override
  Stream<ProductViewModel> getViewModelStream(ProductBloc bloc) {
    return bloc.countryVmPipe.receive;
  }

  @override
  HomePage buildScreen(
    BuildContext context,
    ProductBloc bloc,
    ProductViewModel viewModel,
  ) {
    return HomePage(
      viewModel: viewModel,

    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {

    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Center(

        child: CircularProgressIndicator(),
      ),
    );
  }


  @override
  Widget buildErrorScreen(BuildContext context, Object? error) {
    return  const Center(

      child: Text("Something went wrong"),
    );
  }
}
