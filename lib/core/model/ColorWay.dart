// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ColorWay {
  String name;
  Color color;
  ColorWay({
    required this.name,
    required this.color,
  });

  factory ColorWay.fromJson(Map<String, dynamic> json) {
    return ColorWay(name: json['name'], color: json['color']);
  }
}
