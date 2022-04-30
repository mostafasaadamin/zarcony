import 'package:flutter/material.dart';

class Deals{
  int id;
  String? title;
  bool favourite;
  String desc;
  String address;
  String price;
  String discount;
  Color? color;

  Deals({required this.id, this.title,required  this.favourite,required  this.desc, required this.address,
    required this.price, required this.discount,required  this.color});
}