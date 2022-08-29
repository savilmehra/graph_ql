import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';
import 'cart_presenter.dart';

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (_) => CartBloc(),
      child: CartPresenter(),
    );
  }
}
