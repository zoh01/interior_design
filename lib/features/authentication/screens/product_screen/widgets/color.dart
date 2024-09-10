import 'package:flutter/material.dart';

class ColorProduct {
  final String imagePath;
  final String title;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  ColorProduct(this.imagePath, this.title, this.backgroundColor, this.onPressed);
}