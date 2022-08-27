import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';

import 'products_response.dart';


class CountryEntity extends Entity {
   final ProductResponse data;


   CountryEntity({ProductResponse? d, List<EntityFailure> errors=const[]})
       :   data = d??ProductResponse() // or here
   {

     print("constructor ----${jsonEncode(d)}");
   }


  @override
  List<Object> get props => [errors, data];

  @override
  CountryEntity merge({
    List<EntityFailure>? errors,
    ProductResponse? d,
  }) {


    return CountryEntity(
      errors: errors ?? this.errors,
      d: d,
    );
  }
}
