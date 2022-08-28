import 'package:clean_framework/clean_framework.dart';

import 'products_response.dart';

class ProductViewModel extends ViewModel {
  final ProductResponse data;
  ProductViewModel({required this.data});

  @override
  List<Object> get props => [data];
}
