import 'package:bee/models/restaurnat.dart';
import 'package:flutter/material.dart';
class meal{
  String name;
  String info;
  int price;
  restaurant resName;
  String imgUrl;
  meal({required this.name,required this.info ,required this.price, required this.resName,required this.imgUrl});
  factory meal.fromJson(Map<String,dynamic>json){
    return meal(
        name: json['name'],
        info: json['info'],
        price: json['price'],
        resName: json['resName'],
    imgUrl: json['imgUrl']);
  }
}