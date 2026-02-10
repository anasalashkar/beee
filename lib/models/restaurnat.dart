import 'package:bee/models/meal.dart';
import 'package:flutter/material.dart';
import '';
class restaurant{
  String name;
  String address;
  int phone;
  String ImageUrl;
  int rate;
  List<meal> meals;


  restaurant({required this.name,required this.address,required this.phone,required this.ImageUrl, required this.rate,required this.meals});
factory restaurant.fromJson (Map<String,dynamic>json){
  return restaurant(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      ImageUrl: json['ImageUrl'],
      rate: json['rate'],
    meals: json['meals']
  );
}

}