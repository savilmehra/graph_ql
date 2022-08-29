import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';

import 'cart_response.dart';


class CartEntity extends Entity {
   final CartResponse data;


   CartEntity({CartResponse? d, List<EntityFailure> errors=const[]})
       :   data = d??CartResponse() // or here
   {

     print("constructor ----${jsonEncode(d)}");
   }


  @override
  List<Object> get props => [errors, data];

  @override
  CartEntity merge({
    List<EntityFailure>? errors,
    CartResponse? d,
  }) {


    return CartEntity(
      errors: errors ?? this.errors,
      d: d,
    );
  }
}
