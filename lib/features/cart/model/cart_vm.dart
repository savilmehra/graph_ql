import 'package:clean_framework/clean_framework.dart';

import 'cart_response.dart';

class CartViewModel extends ViewModel {
  final CartResponse data;
  CartViewModel({required this.data});

  @override
  List<Object> get props => [data];
}
