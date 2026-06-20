import 'package:flutter/material.dart';
import 'package:velora/Helper/Color/color_helper.dart';

class CardElement extends StatelessWidget {
  double width;
  double height;
  Color backColor;
  Widget child;
  double radius;
  CardElement({
    super.key,
    required this.height,
    required this.width,
    required this.backColor,
    required this.child,
    this.radius = 0,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: backColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
