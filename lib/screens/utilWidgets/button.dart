
import 'package:flutter/material.dart';
import 'package:project_startup/utils/our_colours.dart';
import 'package:project_startup/utils/our_text_styles.dart';


class Button extends StatelessWidget {
  /// In `color` give 1 if background in blue, give 2 if background is white
  /// In `iconPath` give the path of the image in asset folder
  Button({required this.text, required this.color, this.iconPath});

  final String text;
  String ?iconPath;
  final int color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double width = mediaQueryData.size.width;
    double height = mediaQueryData.size.height;

    return Padding(
      //top: 20.0,
      padding: EdgeInsets.only(
        top: height > 360 ? 20 : 10,
        right: width > 360 ? 2 : 1,
        left: width > 360 ? 2 : 1,
      ),
      child: Container(
        height: height / 16,
        width: width,
        child: Material(
          color: color == 1 ? MyColors.appThemeBlue : MyColors.purewhite,
          shape: RoundedRectangleBorder(
            side: color == 1
                ? BorderSide(color: Colors.blueAccent, width: 1)
                : BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(6.0),
          ),
          elevation: color == 1 ? 5.0 : 0.0,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: color == 1
                        ? MyTextStyle.buttontext1
                        : MyTextStyle.buttontext2,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  if (iconPath != null)
                    Image.asset(
                      '$iconPath',
                      fit: BoxFit.contain,
                    )
                ],
              )),
        ),
      ),
    );
  }
}
