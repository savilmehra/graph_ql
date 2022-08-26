
import 'package:flutter/material.dart';

import 'features/products/ui/home_feature_widget.dart';


class Routes {

  static const String home = '/';
  static const String country = '/products';
  static Widget generate(String routeName) {
    switch (routeName) {
      case home:
        return  HomeFeatureWidget();

      default:
        return const Scaffold(
          body: Center(
            child: Text('404, Page Not Found!'),
          ),
        );
    }
  }
}
