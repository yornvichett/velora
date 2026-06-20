


import 'package:flutter_riverpod/legacy.dart';
import 'package:velora/MVC/Controller/auth_local_controller.dart';
import 'package:velora/MVC/Controller/login_controller.dart';
import 'package:velora/MVC/Controller/product_controller.dart';
import 'package:velora/MVC/Model/auth_local_model.dart';
import 'package:velora/MVC/Model/login_model.dart';
import 'package:velora/MVC/Model/product_model.dart';

var loginFactory = StateNotifierProvider<LoginController,LoginModel>((ref)=> LoginController());
var authLocalFactory = StateNotifierProvider<AuthLocalController,AuthLocalModel>((ref)=> AuthLocalController());
var productFactory = StateNotifierProvider<ProductController,ProductModel>((ref)=> ProductController());