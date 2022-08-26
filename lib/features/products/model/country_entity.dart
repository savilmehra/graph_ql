import 'dart:convert';

import 'package:clean_framework/clean_framework.dart';

import 'products_response.dart';
import '../api/country_api_response.dart';

class CountryEntity extends Entity {
   final ProdustsData data;


   CountryEntity({ProdustsData? d, List<EntityFailure> errors=const[]})
       :   data = d??ProdustsData() // or here
   {

     print("constructor ----${jsonEncode(d)}");
   }


  @override
  List<Object> get props => [errors, data];

  @override
  CountryEntity merge({
    List<EntityFailure>? errors,
    ProdustsData? d,
  }) {


    return CountryEntity(
      errors: errors ?? this.errors,
      d: d,
    );
  }
}
