import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_startup/getx/userDataController.dart';
import 'package:project_startup/utils/our_text_styles.dart';
import 'package:searchfield/searchfield.dart';

import '../../../models/collegeModel.dart';
import '../../../utils/our_colours.dart';

class AnimatedContainerCustom extends StatefulWidget {
  String stringValue1;
  String stringValue2;
  String stringValue3;
  String list;

  AnimatedContainerCustom({required this.stringValue1,required this.stringValue2,required this.stringValue3, required this.list});

  @override
  State<AnimatedContainerCustom> createState() => _AnimatedContainerCustomState();
}

class _AnimatedContainerCustomState extends State<AnimatedContainerCustom> {
  UserDataControllerGet userDataControllerGet = Get.find();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.list=="college") {
      userDataControllerGet.collegeFocus.requestFocus();
    } else {
      userDataControllerGet.branchFocus.requestFocus();
    }
  }


  @override
  Widget build(BuildContext context) {

    //userDataControllerGet.collegeFocus.requestFocus();
    Size size = MediaQuery.of(context).size;
    return Obx(() => AnimatedContainer(
      alignment: widget.list == "college"
          ? Alignment(userDataControllerGet.xAnimation1UniName.value.toDouble(),
          userDataControllerGet.yAnimationUniName.value.toDouble())
          : Alignment(userDataControllerGet.xAnimationBranchName.value,
          userDataControllerGet.yAnimationBranchName.value),
      curve: Curves.bounceOut,
      width: double.infinity,
      color: MyColors.surface4,
      height: size.height / 2.5,
      duration: Duration(seconds: 1),
      child: Stack(
        children: <Widget>[
          //Container(width: size.width,height: 10,),
          Container(

            decoration: BoxDecoration(

                boxShadow: [
                  // BoxShadow(
                  //     blurRadius: 100,
                  //     color: Color(0xff341F44),
                  //     spreadRadius: 2)
                ],
               // color: MyColors.surface1,
               //  border: Border.all(
               //      color: MyColors.surface4, width: 2)
            ),
            //width:size.width,
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                // Text(
                //   widget.stringValue,
                //   style: MyTextStyle.headerMain,
                // ),
            RichText(
              text: TextSpan(
                text: '${widget.stringValue1} ',
                style: MyTextStyle.headerMain,
                children: [
                  TextSpan(
                    text: '${widget.stringValue2}',
                    style: GoogleFonts.inter(
                      color: Color(0xffD682FF),
                    ),
                  ),
                  TextSpan(
                    text: '\n ${widget.stringValue3}',
                    style: MyTextStyle.headerMain,
                  ),
                ],
              ),
            ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: 300,
                    //height: 40,
                    child: Obx(() => SearchField(
                      focusNode: widget.list== "college" ? userDataControllerGet.collegeFocus : userDataControllerGet.branchFocus,
                      searchStyle:
                      GoogleFonts.openSans(color: Colors.white),
                      searchInputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black38)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      suggestionState: Suggestion.hidden,
                      suggestionAction: SuggestionAction.next,

                      suggestions: widget.list == "college"
                          ? userDataControllerGet.collegeList
                          .map((e) => SearchFieldListItem<CollegeModel>(
                        e.name,
                        child: Text(e.name),
                      ))
                          .toList()
                          : userDataControllerGet.branchList
                          .map((e) => SearchFieldListItem<String>(
                        e,
                        child: Text(e),
                      ))
                          .toList(),
                      textInputAction: TextInputAction.next,
                      controller: widget.list == "college"
                          ? userDataControllerGet.name
                          : userDataControllerGet.branch,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter a Party name";
                        } else {
                          // nothing
                          return null;
                        }
                      },
                      // hint: 'SearchField Example 1',
                      // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
                      maxSuggestionsInViewPort: 3,
                      itemHeight: 40,

                      onSuggestionTap: (x) {
                        print(x);
                        print(x.child);
                        print(x.searchKey);
                        //_instance.userSelectedAPartyFetchItPlease(x.searchKey);
                        if (widget.list == "college") {
                          userDataControllerGet
                              .userSelectedCollege(x.searchKey);
                        } else {
                          userDataControllerGet
                              .userSelectedBranch(x.searchKey);
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      emptyWidget: const Text("Nothing found"),
                    ))),
              ],
            ),
          ),
          // Positioned(
          //   //right:40,
          //   //top:-30,
          //   //bottom:-30,
          //   //left:310,
          //   //right:-300,
          //   //top:300,
          //   bottom:2,
          //   left:300,
          //   child: RotatedBox(
          //     quarterTurns: 1,
          //     child: Container(
          //       //height: 100,
          //       width:size.height / 2.5,
          //         child: Lottie.network(
          //             "https://assets8.lottiefiles.com/packages/lf20_no9qrf5p.json")),
          //   ),
          // )
        ],
      ),
    ));
  }
}
