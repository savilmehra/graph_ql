import 'package:clean_framework/clean_framework.dart';

import 'products_response.dart';

class CountryVm extends ViewModel {
  final ProductResponse data;
  CountryVm({required this.data});

  @override
  List<Object> get props => [data];
}
