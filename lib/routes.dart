
import 'package:flutter/material.dart';

import 'features/cart/ui/cart_presenter.dart';
import 'features/cart/ui/cart_widget.dart';
import 'features/products/ui/home_feature_widget.dart';


class Routes {

  static const String home = '/';
  static const String get = '/get';
  static const String cart = '/cart';
  static Widget generate(String routeName) {
    switch (routeName) {
      case home:
        return  HomeFeatureWidget();
      case get:
        return  HomeFeatureUsingGetWidget();
      case cart:
        return  CartWidget();
      default:
        return const Scaffold(
          body: Center(
            child: Text('404, Page Not Found!'),
          ),
        );
    }
  }
}
