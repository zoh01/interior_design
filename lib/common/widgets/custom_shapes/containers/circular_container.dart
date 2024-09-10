import 'package:flutter/material.dart';

class ZCircularContainer extends StatelessWidget {
  const ZCircularContainer({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    this.padding = 0,
    this.child,
    this.backgroundColor = Colors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
