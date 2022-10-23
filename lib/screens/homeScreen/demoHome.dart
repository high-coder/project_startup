import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_startup/getx/authController.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  AuthService authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child:Column(
            children: [
              Text(
                "This is your home mate",
                style: GoogleFonts.openSans(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  authController.logOut();
                },
                child: Text("Logout",                style: GoogleFonts.openSans(color: Colors.white),
                ),
              )
            ],
          )
      ),
    );
  }
}
