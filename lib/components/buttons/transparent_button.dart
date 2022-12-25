import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_startup/models/button_model.dart';

import '../../utils/our_colours.dart';

class TransparentButton extends StatelessWidget {
  ButtonModel buttonDetails;
  Function onTapp;
  TransparentButton(
      {Key? key, required this.buttonDetails, required this.onTapp})
      : super(key: key);

  late double height;
  late double width;
  late double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapp();
      },
      child: Container(child: Builder(
        builder: (context) {
          if (buttonDetails.size == "sm") {
            width = 105;
            height = 36;
            radius = 47;
          } else if (buttonDetails.size == "lg") {
            width = 125;
            height = 44;
            radius = 47;
          } else if (buttonDetails.size == "custom") {
            width = buttonDetails.width ?? 0.0;
            height = buttonDetails.height ?? 0;
            radius = buttonDetails.radius ?? 0;
          }

          return Container(
              width: width,
              height: height,
              decoration: buttonDetails.buttonColor == null
                  ? BoxDecoration(
                      //color: MyColors.surface4,  // this is the transparent button
                      //gradient: ,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          MyColors.purpleColor,
                          MyColors.purpleColor2,
                        ],
                      ),
                      //color: MyColors.purpleColor,
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(
                          width: 2,
                          color: buttonDetails.borderColor ??
                              Colors.white.withOpacity(0.7)),
                    )
                  : BoxDecoration(
                      color:
                          MyColors.surface4, // this is the transparent button

                      //color: MyColors.purpleColor,
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(
                          width: 2,
                          color: buttonDetails.borderColor ??
                              Colors.white.withOpacity(0.7)),
                    ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonDetails.text,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: buttonDetails.borderColor ?? Colors.white,
                      ),
                    ),
                    buttonDetails.icon == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              buttonDetails.iconB,
                              color: buttonDetails.borderColor,
                            ))
                        : Container(),
                  ],
                ),
              ));
        },
      )),
    );
  }
}
