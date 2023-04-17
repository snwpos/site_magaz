import 'package:flutter/material.dart';

class Brand {
  String name;
  Brand({required this.name});
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(name: json['name']);
  }
}