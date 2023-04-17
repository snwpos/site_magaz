import 'package:flutter/material.dart';

class Type {
  String name;
  Type({required this.name});
  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(name: json['name']);
  }
}