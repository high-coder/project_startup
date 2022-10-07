import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'our_colours.dart';

// const height = MediaQueryData().size.height;
// const width = MediaQueryData().;

class MyTextStyle {

  /// new text styles --------------------------------

   static TextStyle titleLS= GoogleFonts.openSans(
    fontWeight: FontWeight.bold,
     color: Colors.white,
     fontSize: 30
  );
   static TextStyle titleLSs= GoogleFonts.openSans(
       fontWeight: FontWeight.bold,
       color: Colors.white,
       fontSize: 24
   );


   static TextStyle titleLSBlack= GoogleFonts.openSans(
    fontWeight: FontWeight.bold,
     color: Colors.black,
     fontSize: 30
  );


  static TextStyle headingPostPage = GoogleFonts.openSans(
      fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle listTileFont=  GoogleFonts.openSans(fontSize: 15, color: Colors.black);

  /// end of new text styles
  static const TextStyle headingPop4 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: MyColors.bluishGrey,
    fontFamily: 'Poppins',
  );

  static const TextStyle otpText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.bluishGrey,
    fontFamily: 'Poppins',
  );
  static const TextStyle headingSecondary = TextStyle(
    color: MyColors.black_light_01,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle heading1 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w600,
    color: MyColors.soapStoneWhite,
    fontFamily: 'Poppins',
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: MyColors.divider_color,
    fontFamily: 'Poppins',
  );
  static TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 30.0,
    fontWeight: FontWeight.w600,
    color: MyColors.pureblack,

  );

  static const TextStyle headingTitle = TextStyle(
    color: MyColors.black_light_01,
    fontSize: 23,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle av_title = TextStyle(
    color: MyColors.available_servics,
    fontSize: 30,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appBarTitle = TextStyle(
    color: MyColors.black_light_01,
    fontSize: 17,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle informationText =
  TextStyle(color: Color(0xff494949), fontSize: 13);
  static const TextStyle heading3 = TextStyle(
    // used in looking for heading
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: 'Roboto',
  );

  static const TextStyle nameStyle = TextStyle(
      color: MyColors.black_light_01, fontSize: 15, fontFamily: 'Poppins');

  static const TextStyle typeMechanic = TextStyle(
    color: MyColors.darkishBlue,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );

  static const TextStyle copy = TextStyle(
    color: MyColors.darkishBlue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static const TextStyle text1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: MyColors.black_light_01,
    fontFamily: 'Poppins',
  );
  static const TextStyle text10 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: MyColors.lightgrey2,
    fontFamily: 'Poppins',
  );
  static const TextStyle text11 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: MyColors.lightGrey,
    decoration: TextDecoration.underline,
    fontFamily: 'Roboto',
  );

  static const TextStyle text2 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.blue_ribbon,
    fontFamily: 'Poppins',
  );

  static TextStyle text3 = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.purewhite,
    //fontFamily: 'Poppins',
  );

  static const TextStyle text4 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.purewhite,
    fontFamily: 'Poppins',
  );

  static const TextStyle text4white = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.purewhite,
    fontFamily: 'Poppins',
  );
  static const TextStyle text4roboto = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.darkGrey,
    fontFamily: 'Poppins',
  );

  static const TextStyle text5 = TextStyle(
    //used for looking for subheading
    fontSize: 15.0,
    fontWeight: FontWeight.w300,
    color: MyColors.pureblack,
    fontFamily: 'Roboto',
  );

  static const TextStyle text6 = TextStyle(
    // used for card names
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );

  static  TextStyle referEarnText = GoogleFonts.poppins(
    // used for card names
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: MyColors.lightGrey,
    //fontFamily: 'Poppins',
  );
  static  TextStyle referEarnTextW = GoogleFonts.poppins(
    // used for card names
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: MyColors.purewhite,
    //fontFamily: 'Poppins',
  );


   static TextStyle button1 = GoogleFonts.poppins(
     fontSize: 18.0,
     fontWeight: FontWeight.w500,
     color: MyColors.soapStoneWhite,
     //fontFamily: 'Poppins',
   );



  static const TextStyle open = TextStyle(
    // used for card names
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: MyColors.lightGreen,
    fontFamily: 'Poppins',
  );
  static const TextStyle Close = TextStyle(
    // used for card names
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: MyColors.red,
    fontFamily: 'Poppins',
  );

  static TextStyle text7 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.blue[400],
    fontFamily: 'Poppins',
  );

  static const TextStyle text8 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.purewhite,
    fontFamily: 'Roboto',
  );
  static const TextStyle text9 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: MyColors.bluishGrey,
    fontFamily: 'Poppins',
  );
  static TextStyle aboutus = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.about_us,
    fontFamily: 'Roboto',
  );
  static TextStyle time_heading = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );
  static TextStyle timing = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Color(0xffFF8A00),
    fontFamily: 'Poppins',
  );

  static const TextStyle buttontext1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: MyColors.purewhite,
    fontFamily: 'Poppins',
  );
  static  TextStyle buttontext2 = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    //fontFamily: 'Poppins',
  );

  static const TextStyle sidebarbuttontext1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.pureblack,
    fontFamily: 'Roboto',
  );

  static const TextStyle sidebartext1 = TextStyle(
    // used for drawer header username text
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.purewhite,
    fontFamily: 'Roboto',
  );

  static const TextStyle AddVehicles = TextStyle(
    // used for drawer header username text
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: MyColors.darkGrey,
    fontFamily: 'Roboto',
  );

  static const TextStyle sidebartext2 = TextStyle(
    // used for drawer header email
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.purewhite,
    fontFamily: 'Roboto',
  );

  static const TextStyle sidebartext3 = TextStyle(
    // used for drawer list content
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Roboto',
  );
  static const TextStyle usageAgeHeading = TextStyle(
    // used for drawer list content
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static const TextStyle usageAge = TextStyle(
    // used for drawer list content
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  static const TextStyle usageAgeText = TextStyle(
    // used for drawer list content
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  static const TextStyle usageAgeDate = TextStyle(
    // used for drawer list content
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Color(0xff9D9D9D),
    fontFamily: 'Poppins',
  );
  static const TextStyle dropdown = TextStyle(
    // used for drawer list content
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );

  static TextStyle booking_text = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: MyColors.about_us,
    fontFamily: 'Poppins',
  );
  static TextStyle report_text = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );
  static TextStyle details_text = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );

  static TextStyle availableServicesHeading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );

  static TextStyle appBarTextSupporting = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );

  static TextStyle shopHeading1 = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.pureblack,
    //fontFamily: 'Poppins',
  );
  static TextStyle shopHeading2 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: MyColors.pureblack,
    fontFamily: 'Poppins',
  );

  static TextStyle shopText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.bluishGrey,
    fontFamily: 'Poppins',
  );
  static TextStyle shopText2 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: MyColors.bluishGrey,
    fontFamily: 'Poppins',
  );

  static TextStyle shopButton1 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: MyColors.purewhite,
    fontFamily: 'Poppins',
  );
  static TextStyle shopButton2 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.purewhite,
    fontFamily: 'Poppins',
  );
  static const TextStyle filter = TextStyle(
    // used for drawer list content
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.soapStoneWhite,
    fontFamily: 'Poppins',
  );

  static TextStyle buttonTextU = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: MyColors.soapStoneWhite,
    fontFamily: 'Poppins',
  );
}
