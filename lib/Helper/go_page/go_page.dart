import 'package:flutter/material.dart';

class GoPage {
  static toPage({required BuildContext context,required Widget page}){
    Navigator.push(context, MaterialPageRoute(builder:(context) => page,));
  }
}