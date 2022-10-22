import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_startup/services/ourDatabase.dart';
import 'package:project_startup/utils/our_colours.dart';

import '../models/collegeModel.dart';

class UserDataControllerGet extends GetxController {
  late FocusNode universityController;
  final TextEditingController name = TextEditingController();

  UserDataControllerGet() {
    universityController = FocusNode();
  }

  var disableContinue = true.obs;


  Color buttonColor = MyColors.greyCredColorDisabled;
  CollegeModel ?selectedModel;
  userSelectedCollege(String collegeName) {
    name.text = collegeName;
    for (var element in collegeList) {
      if(element.name == collegeName) {
        selectedModel = element;
        break;
      }
    }
    disableContinue.value = false;
    buttonColor = MyColors.whiteColor;
  }


  toggleColors() {

    disableContinue.value = true;
    buttonColor = MyColors.greyCredColorDisabled;
  }

  var collegeList = [].obs;

  /// This will ne used to fetch the university names
  fetchUniversityNames() async{
    collegeList.value = await OurDatabase().fetchUniversities();
    name.addListener(() {
      print(name.text);
      if(selectedModel !=null) {
        if(name.text!=selectedModel?.name) {
          selectedModel = null;
          toggleColors();
        }
      }
    });
  }

}