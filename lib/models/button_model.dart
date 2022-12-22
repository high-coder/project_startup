import 'package:flutter/material.dart';

class ButtonModel {
  bool icon;
  String text;
  bool border;
  double? width;
  double? height;
  double? radius;
  Color? borderColor;
  IconData? iconB;
  String size; // sm-small, md- medium, lg-large
  ButtonModel(
      {required this.text,
      required this.size,
      required this.icon,
      required this.border,
      this.radius,
      this.height,
      this.width,
      this.borderColor,
      this.iconB});
}
