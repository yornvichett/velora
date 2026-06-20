import 'package:flutter/material.dart';

class SpacerElement extends StatelessWidget {
  double height;
  double width;
   SpacerElement({super.key,this.width=0,this.height=0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}