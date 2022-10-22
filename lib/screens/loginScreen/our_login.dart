import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:project_startup/getx/authController.dart';
import 'package:project_startup/getx/currentState.dart';
import 'package:project_startup/screens/utilWidgets/button.dart';
import 'package:project_startup/utils/our_colours.dart';
import 'package:project_startup/utils/our_text_styles.dart';

class OurLoginPage extends StatefulWidget {
  const OurLoginPage({Key? key}) : super(key: key);

  @override
  _OurLoginPageState createState() => _OurLoginPageState();
}

class _OurLoginPageState extends State<OurLoginPage> {
  var isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final CurrentState _instance = Get.find();
  final AuthService authController = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double width = mediaQueryData.size.width;
    double height = mediaQueryData.size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [

              SizedBox(
                width: width,
                height: height - 25,
                //height: height / 3.3 > 270 ? 280 : height / 3.3,
                //child: Lottie.asset("assets/lottie/login.json")
                child: Lottie.network(
                    "https://assets7.lottiefiles.com/private_files/lf30_wldncgll.json",fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(20),
                  child: NeoPopButton(
                    color: Colors.white,
                    bottomShadowColor: MyColors.googleGreen,
                    rightShadowColor: MyColors.googleGreen,
                    //leftShadowColor: MyColors.googleYellow,
                    animationDuration: Duration(milliseconds: 100),
                    depth: 3,
                    onTapUp: () {
                      print("someone is calling me here mate");
                      authController.loginUserWithGoogle(context);
                    },
                    onTapDown: () {
                      print("Calling me in the down area");
                    },

                    child: Padding(
                      //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login with Google",
                              style: GoogleFonts.openSans(
                                  color: Colors.black, fontSize: 15)),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset('assets/icons/Google.png')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 40,
              //   child:Container(
              //     child: Text("Welcome to our application",style: MyTextStyle.headerMain,
              //     ),
              //   )
              // )
            ],
          ),
        ),
      ),
    );
  }
}
