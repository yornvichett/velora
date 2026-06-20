import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Factory/profider_factory.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/app_button_element.dart';
import 'package:velora/Helper/Elements/app_text_input_element.dart';
import 'package:velora/Helper/Elements/spacer_element.dart';
import 'package:velora/Helper/go_page/go_page.dart';
import 'package:velora/MVC/Controller/login_controller.dart';
import 'package:velora/MVC/Model/login_model.dart';
import 'package:velora/MVC/View/Home/home_view.dart';
import 'package:velora/Repository/RequestBody/login_request_body.dart';
import 'package:velora/Repository/State/login_state.dart';

class AuthLoginView extends ConsumerWidget {
  AuthLoginView({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var loginController = ref.read(loginFactory.notifier);
    var loginModel = ref.watch(loginFactory);
    ref.listen<LoginModel>(loginFactory, (pre,next){
      if(next.state==LoginState.success){
        GoPage.toPage(context: context, page: HomeView());
      }
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorHelper.background,

      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextInputElement(
                  controller: username,
                  hintText: "Username",
                  prefixIcon: Icons.person,
                  activeColor: ColorHelper.bannerColor,
                  iconColor: Colors.grey,
                  fillColor: Colors.white,
                ),
                SpacerElement(height: 5),
                AppTextInputElement(
                  controller: password,
                  isPassword: true,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  activeColor: ColorHelper.bannerColor,
                  iconColor: Colors.grey,
                  fillColor: Colors.white,
                ),
                SpacerElement(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password",
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: ColorHelper.bannerColor,
                      ),
                    ),
                  ],
                ),
                SpacerElement(height: 20),

                AppButtonElement(
                  width: size.width,
                  backgrounColor: ColorHelper.bannerColor,
                  onTab: () {
                    var body =LoginRequestBody(
                      conId: username.text.trim(),
                      userName: username.text.trim(),
                      password: password.text.trim()
                    );
                    loginController.userLogin(body: body);
                    
                  },
                ),

                Text("controller ===> ${loginModel.state}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
