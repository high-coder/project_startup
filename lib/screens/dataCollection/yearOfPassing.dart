import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:project_startup/getx/userDataController.dart';
import 'package:project_startup/screens/dataCollection/localWidgets/customPicker.dart';
import 'package:project_startup/screens/dataCollection/userDataCollection.dart';
import 'package:project_startup/utils/our_colours.dart';

class YearOfPassing extends StatefulWidget {
  const YearOfPassing({Key? key}) : super(key: key);

  @override
  State<YearOfPassing> createState() => _YearOfPassingState();
}

class _YearOfPassingState extends State<YearOfPassing> {
  late FixedExtentScrollController _foot;

  UserDataControllerGet userData = Get.find();
  int selectedValue = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foot = FixedExtentScrollController(initialItem: 2);

  }
  List dataList=  [2022,2023,2024,2025,2026];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //floatingActionButton:
      body: Container(
        width: size.width,
        height: size.height,
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Spacer(flex:1),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                margin: EdgeInsets.only(top:size.height/3.2),
                child: CustomPicker(
                  onChange: (value) {
                    print(value);
                  },
                  height: 300, data:dataList , controller: _foot, width: 400,),
              ),
              //Spacer(flex:1),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child:NeoPopButton(
                      //enabled: userDataControllerGet.disableContinue.value,

                      //color: userDataControllerGet.buttonColor,
                      color:Colors.white,

                      shadowColor: Colors.white,

                      bottomShadowColor: MyColors.greyCredColorDisabled
                          .withOpacity(0.3),
                      rightShadowColor: MyColors.whiteColor.withOpacity(0.7),
                      //leftShadowColor: MyColors.googleYellow,
                      disabledColor: MyColors.greyCredColorDisabled,
                      animationDuration: Duration(milliseconds: 100),
                      depth: 3.5,
                      onTapUp: () async{
                        print("someone is calling me here mate");
                        await userData.updateUserYearOfPassing(dataList[selectedValue]);
                        userData.updateDetailsOfUser();
                        //authController.loginUserWithGoogle(context);
                      },
                      onTapDown: () {
                        print("Calling me in the down area");
                      },

                      child: Padding(
                        //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Continue    -->",
                                style: GoogleFonts.openSans(
                                    color:
                                    Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),


      ),
    );
  }
}
