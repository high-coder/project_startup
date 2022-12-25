import 'package:flutter/material.dart';

class MyColors {
  static const Color backgroundColor = const Color(0xffFEFEFE);

  static const Color purewhite = const Color(0xffFFFFFF);
  static const Color pureblack = const Color(0xff000000);
  static const Color sidebargrey = const Color(0xffE0E0E0);
  static const Color divider_color = const Color(0xffD1D1D1);
  static const Color darkGrey = const Color(0xff323232);
  static const Color lightgrey = const Color(0xffF8F8F8);

  static const Color black_light_01 = const Color(0xff1F1F1F);
  static const Color text2 = const Color(0xffAEAEAE);
  static const Color service_card_border = const Color(0xff0066FF);
  static const Color service_card_background = const Color(0xffEFF5FF);
  static const Color about_us = const Color(0xff808080);
  static const Color garage_timing = const Color(0xffFFEDD7);
  static const Color usageCard = const Color(0xffF3F3F3);
  static const Color available_servics = const Color(0xff30324C);

  static const Color blue_ribbon = const Color(0xff1130EB); // used for  ==> icon, button

  static const Color soapStoneWhite = const Color(0xffFFFCFA);
  static const Color soapStoneGrey = const Color(0xffEFE6E1);
  static const Color pinkishGrey = const Color(0xffF2F2F2);
  static const Color parrotGreen = const Color(0xff00C74F);
  static const Color darkishBlue = const Color(0xff0066FF);
  static const Color circularProgressIndicator = const Color(0xff17C75D);
  static const Color lightGrey = const Color(0xff767676);
  static const Color bluishGrey = const Color(0xff3F425E);
  static const Color yellowish = Color(0xffF5CA37);
  static const Color lightYellowish = Color(0xffFDD651);
  static const Color lightGreen = const Color(0xff00AE31);
  static const Color detailYellow = const Color(0xffFFF9E3);
  static const Color shopButton = const Color(0xff1E2036);
  static const Color lightBlack = const Color(0xff3F425E);
  static const Color lightPurple = const Color(0xffEBEDFF);
  static const Color lightgrey2 = const Color(0xffADADAD);
  static const Color lightgrey3 = const Color(0xffDBDBDB);
  static const Color red = const Color(0xffFF0000);
  static const Color bluishTint = const Color(0xff00FF85);



  /// new colors --------------------------
  static const Color appThemeBlue = const Color(0xff053047);
  static const Color appThemeRed = Color(0xff0800F2F);
  static const Color appThemeBlueText = Color(0xff4fa2f1);
  static const Color lightWightPBG = Color(0xfff0f0f0);

  //static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.white;




  static const Map<int, Color> primaryColorCodes = {
    50: Color.fromRGBO(12, 176, 117, .1),
    100: Color.fromRGBO(12, 176, 117, .2),
    200: Color.fromRGBO(12, 176, 117, .3),
    300: Color.fromRGBO(12, 176, 117, .4),
    400: Color.fromRGBO(12, 176, 117, .5),
    500: Color.fromRGBO(12, 176, 117, .6),
    600: Color.fromRGBO(12, 176, 117, .7),
    700: Color.fromRGBO(12, 176, 117, .8),
    800: Color.fromRGBO(12, 176, 117, .9),
    900: Color.fromRGBO(12, 176, 117, 1),
  };

  static const MaterialColor primaryColor =
  MaterialColor(0xFF4991F8, primaryColorCodes);

  static const Color whiteColor = Colors.white;

  /// This will be the theme data
  static  ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: primaryColor,
    scaffoldBackgroundColor: surfaceO,
    backgroundColor: surface4,

    bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black)
  );



  /// google logo colors
  static const Color googleRed =  Color(0xffe43e2b);
  static const Color googleYellow =  Color(0xfff0b501);
  static const Color googleGreen =  Color(0xff2ba24c);
  static const Color googleBlue =  Color(0xff3b7ded);
  /// end of the google colors

  static const Color greyCredColorTopWala =  Color(0xff121212);
  static const Color greyCredColorDisabled = Color(0xff8a8a8a);





  ///  ------------------------------------- this is the new application theme -----------------------apptheming colors SURFACE COLORS
  static const Color surfaceO =  Color(0xff110817);
  static const Color surface1 =  Color(0xff170D1E);
  static const Color surface4 =  Color(0xff291B31);
  static const Color purpleColor = Color(0xff6F0FDB);
  static const Color purpleColor2 = Color(0xff9C15DB);
  static const Color textPurple = Color(0xffD682FF);
  /// random colors
  static const Color redColor=  Color(0xffFF7E76);

  /// ---------------------------------------- end of the new application theme ----------------------///

}
