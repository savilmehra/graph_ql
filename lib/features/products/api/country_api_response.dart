import 'package:clean_framework/clean_framework_defaults.dart';



class CountryAPIResponse extends JsonResponseModel{
 late final Data? data;

  CountryAPIResponse({this.data});

  CountryAPIResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [data];
}

class Data extends JsonResponseModel {
  List<Countries>? countries;

  Data({this.countries});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override

  List<Object?> get props => [countries];
}

class Countries extends JsonResponseModel {
  String? name;

  Countries({this.name});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  @override

  List<Object?> get props =>[name];
}
