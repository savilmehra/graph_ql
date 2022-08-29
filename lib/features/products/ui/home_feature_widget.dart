import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import 'package:graph_ql/features/products/ui/presenter_get_request.dart';

import '../bloc/get_product_bloc.dart';
import '../bloc/product_bloc.dart';
import 'presenter_query_request.dart';

class HomeFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(),
      child: QueryPresenter(),
    );
  }
}
class HomeFeatureUsingGetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProductsBloc>(
      create: (_) => GetProductsBloc(),
      child: PresenterGetRequest(),
    );
  }
}