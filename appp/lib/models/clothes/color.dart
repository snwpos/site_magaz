import 'package:flutter/material.dart';

class Color {
  String name;
  Color({required this.name});
  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(name: json['name']);
  }
}