import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:project_startup/components/buttons/transparent_button.dart';
import 'package:project_startup/getx/userDataController.dart';
import 'package:project_startup/models/button_model.dart';
import 'package:project_startup/models/collegeModel.dart';
import 'package:project_startup/screens/dataCollection/localWidgets/animatedContainerCustom.dart';
import 'package:project_startup/utils/our_colours.dart';
import 'package:project_startup/utils/our_text_styles.dart';
import 'package:searchfield/searchfield.dart';

class UserDataCollection extends StatefulWidget {
  //final Map<String, dynamic> userData;
  int stateValue;

  UserDataCollection(this.stateValue);

  @override
  _UserDataCollectionState createState() => _UserDataCollectionState();
}

class _UserDataCollectionState extends State<UserDataCollection> {
  String university = '';

  //FocusNode collegeFocus = FocusNode();
  UserDataControllerGet userDataControllerGet =
  Get.put(UserDataControllerGet());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //userDataControllerGet.universityController.requestFocus();
    userDataControllerGet.fetchUniversityNames();
    //userDataControllerGet.state.value = 0;
    // Future.delayed(Duration(seconds: 1))
    // .then((value) => collegeFocus.requestFocus());

    changeValue();
    if (widget.stateValue == 0) {
      userDataControllerGet.startAnimationOneUniName();
      //userDataControllerGet.collegeFocus.requestFocus();
      Future.delayed(Duration(seconds: 1)).then((value) =>
          userDataControllerGet.collegeFocus.requestFocus());
    } else if (widget.stateValue == 1) {
      userDataControllerGet.startAnimationTwoBranchName();
      Future.delayed(Duration(seconds: 1)).then((value) =>
          userDataControllerGet.branchFocus.requestFocus());
    }
  }

  changeValue() async {
    await Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        x = -1;
      });


    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // userDataControllerGet.collegeFocus.dispose();
    //
    // userDataControllerGet.name.removeListener(() {});
    // userDataControllerGet.dispose();
  }

  double x = 20;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return WillPopScope(
      onWillPop: () {
        bool status = false;
        if (userDataControllerGet.state.value == 1) {
          userDataControllerGet.startAnimationOneUniName();
        } else {
          //return Future.value(status);
          status = true;
        }
        return Future.value(status);
        //return false;
      },
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(() {
                  if (userDataControllerGet.state.value == 0) {
                    return AnimatedContainerCustom(
                      stringValue1: "my", list: "college",stringValue2: "university",stringValue3: "is",);
                  } else if (userDataControllerGet.state.value == 1) {
                    // return AnimatedContainer(
                    //   alignment: Alignment(userDataControllerGet.xAnimationBranchName.value,userDataControllerGet.yAnimationBranchName.value ),
                    //   duration: Duration(milliseconds: 500),
                    //   curve: Curves.bounceOut,
                    //   width: double.infinity,
                    //   color: MyColors.greyCredColorTopWala,
                    //   height: size.height / 2.5,
                    //   child: Stack(
                    //     children: <Widget>[
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 20, left: 20),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const Spacer(),
                    //             Text(
                    //               "my branch \nis",
                    //               style: MyTextStyle.headerMain,
                    //             ),
                    //             const SizedBox(
                    //               height: 10,
                    //             ),
                    //             Container(
                    //                 margin: const EdgeInsets.only(bottom: 30),
                    //                 width: 300,
                    //                 //height: 40,
                    //                 child: Obx(() => SearchField(
                    //                   focusNode: userDataControllerGet.branchFocus,
                    //                   searchStyle: GoogleFonts.openSans(
                    //                       color: Colors.white),
                    //                   searchInputDecoration:
                    //                   const InputDecoration(
                    //                     border: OutlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                             width: 1,
                    //                             color: Colors.black38)),
                    //                     focusedBorder: InputBorder.none,
                    //                     enabledBorder: InputBorder.none,
                    //                     disabledBorder: InputBorder.none,
                    //                   ),
                    //                   suggestionState: Suggestion.expand,
                    //                   suggestionAction: SuggestionAction.next,
                    //
                    //                   suggestions: userDataControllerGet
                    //                       .branchList
                    //                       .map((e) =>
                    //                       SearchFieldListItem<String>(
                    //                         e,
                    //                         child: Text(e),
                    //                       ))
                    //                       .toList(),
                    //                   textInputAction: TextInputAction.next,
                    //                   controller:
                    //                   userDataControllerGet.branch,
                    //                   validator: (value) {
                    //                     if (value?.isEmpty ?? true) {
                    //                       return "Please enter a Party name";
                    //                     } else {
                    //                       // nothing
                    //                       return null;
                    //                     }
                    //                   },
                    //                   // hint: 'SearchField Example 1',
                    //                   // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
                    //                   maxSuggestionsInViewPort: 3,
                    //                   itemHeight: 40,
                    //
                    //                   onSuggestionTap: (x) {
                    //                     print(x);
                    //                     print(x.child);
                    //                     print(x.searchKey);
                    //                     //_instance.userSelectedAPartyFetchItPlease(x.searchKey);
                    //                     userDataControllerGet
                    //                         .userSelectedBranch(x.searchKey);
                    //                     FocusManager.instance.primaryFocus
                    //                         ?.unfocus();
                    //                   },
                    //                   emptyWidget:
                    //                   const Text("Nothing found"),
                    //                 ))),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                    return AnimatedContainerCustom(
                      stringValue1: "my",stringValue2: "branch",stringValue3: "is",list: "branch",);
                  } else {
                    return Container();
                  }
                }),
                const Spacer(flex: 1),
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "This is your entry ticket to your campus super app",
                      style: MyTextStyle.helperTextGrey,
                    )),

                /// cred button will go here
                //Container(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),width:double.infinity,child: TransparentButton(buttonDetails: ButtonModel(border: false,icon: false,size: "custom",text: "Next ->",radius: 40,height: 60,width: 100))),
                Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Obx(
                          () =>
                          NeoPopButton(
                            enabled: userDataControllerGet.disableContinue
                                .value,

                            color: userDataControllerGet.disableContinue
                                .value == true ? MyColors.surface4 : MyColors
                                .greyCredColorDisabled,

                            //shadowColor: Colors.white,

                            bottomShadowColor:
                            MyColors.greyCredColorDisabled.withOpacity(0.3),
                            rightShadowColor: MyColors.whiteColor.withOpacity(
                                0.7),
                            //leftShadowColor: MyColors.googleYellow,
                            disabledColor: MyColors.greyCredColorDisabled,
                            animationDuration: Duration(milliseconds: 100),
                            depth: 3.5,
                            onTapUp: () async {
                              print("someone is calling me here mate");
                              //userDataControllerGet.updateUserCollege();
                              //userDataControllerGet.state.value =1;
                              if (userDataControllerGet.disableContinue.value) {
                                if (userDataControllerGet.state.value == 1) {
                                  userDataControllerGet.updateUserBranch();
                                } else
                                if (userDataControllerGet.state.value == 0) {
                                  userDataControllerGet.updateUserCollege();
                                  userDataControllerGet
                                      .stepTwoAnimationOneUniName();

                                  // await Future.delayed(Duration(seconds: 1))
                                  //     .then((value) =>
                                  //     userDataControllerGet.branchFocus
                                  //         .requestFocus());
                                }
                              }
                              //branchFocus.requestFocus();
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
                                  Text("Next    -->",
                                      style: GoogleFonts.openSans(
                                          color: !userDataControllerGet
                                              .disableContinue.value
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


