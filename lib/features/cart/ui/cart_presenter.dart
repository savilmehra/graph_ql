import 'dart:async';

import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import '../bloc/cart_bloc.dart';
import '../model/cart_vm.dart';
import 'cart_page.dart';

class CartPresenter extends Presenter<CartBloc, CartViewModel, CartPage> {
  @override
  Stream<CartViewModel> getViewModelStream(CartBloc bloc) {
    return bloc.countryVmPipe.receive;
  }

  @override
  CartPage buildScreen(
    BuildContext context,
    CartBloc bloc,
    CartViewModel viewModel,
  ) {
    return CartPage(
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
