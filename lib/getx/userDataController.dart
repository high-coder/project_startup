import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_startup/getx/currentState.dart';
import 'package:project_startup/screens/dataCollection/yearOfPassing.dart';
import 'package:project_startup/services/ourDatabase.dart';
import 'package:project_startup/utils/our_colours.dart';

import '../models/collegeModel.dart';
import '../screens/homeScreen/demoHome.dart';

class UserDataControllerGet extends GetxController {
  late FocusNode universityController;
  final TextEditingController name = TextEditingController();
  final TextEditingController branch = TextEditingController();

  UserDataControllerGet() {
    universityController = FocusNode();
  }

  var disableContinue = false.obs;


  /// Important variable --------------------------------------------------
  var state = 0.obs; // o means select university // 1 means select branch
  /// Important variable ends ---------------------------------------------



  var xAnimation1UniName = 20.0.obs;
  var yAnimationUniName = 0.0.obs;
  startAnimationOneUniName() async{
    await Future.delayed(Duration(milliseconds:500));
    xAnimation1UniName.value = 0.0;
    yAnimationUniName.value = 0.0;
    xAnimationBranchName.value = 20.0;
    yAnimationBranchName.value = 0.0;
    //Get.replace(() => UserDataControllerGet());
    state.value = 0;
    //state.value=0;


  }

  FocusNode collegeFocus = FocusNode();
  FocusNode branchFocus = FocusNode();

  /// state one animation begins here =======================================
  stepTwoAnimationOneUniName() async{
    //await Future.delayed(Duration(seconds:1));

    disableContinue.value = false;
    xAnimation1UniName.value = -20.0;
    await Future.delayed(Duration(milliseconds:500));

    print("Animation must be finished by now");
    startAnimationTwoBranchName();
  }


  var xAnimationBranchName = 20.0.obs;
  var yAnimationBranchName = 0.0.obs;
  startAnimationTwoBranchName() async{
    state.value=1;
    //await Future.delayed(Duration(seconds:1));

    xAnimationBranchName.value = 0.0;
    branchFocus.requestFocus();

  }
  /// state one animation ends here =========================================



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
    print("this is the above of the college name ===========================");
    print(selectedModel?.name);
    print(selectedModel?.id);
    print("this is the below of the college name ===========================");

    disableContinue.value = true;
    buttonColor = MyColors.whiteColor;
  }

  userSelectedBranch(String branchVal) {
    branch.text = branchVal;
    disableContinue.value = true;
    buttonColor = MyColors.whiteColor;

  }


  toggleColors() {

    disableContinue.value = false;
    buttonColor = MyColors.greyCredColorDisabled;
  }

  var collegeList = [].obs;

  var branchList = [
    "Computer Science and Engineering",
    "Mechanical",
    "Electrical",
    "Electrical and Computers"
  ].obs;
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


  /// this will be used to update the college of the user
  updateUserCollege() async{
    CurrentState _instance = Get.find();
    if(selectedModel!=null) {
      //String returnVal = await OurDatabase().updateUserCollege(selectedModel?.id ?? "",_instance.currentUser?.uid ?? "");
      //if(returnVal == "success") {
      _instance.currentUser?.universityId = selectedModel?.id;
      _instance.currentUser?.universityName = selectedModel?.name;
      _instance.saveUpdatedUser();
      //Get.to(() =>const YearOfPassing());
      //}
    }
  }


  updateUserBranch() async{
    CurrentState _instance = Get.find();
    if(branch.text.isNotEmpty) {
      //String retVal = await OurDatabase().updateUserBranch(_instance.currentUser?.uid ?? "", branch.text);
      //f(retVal == "success") {
        // do something here man
      _instance.currentUser?.branch = branch.text;
      _instance.saveUpdatedUser();

       Get.to(()=>const YearOfPassing());
      //}
    }
  }

  updateUserYearOfPassing(int yearOfPassing) async{
    CurrentState instance = Get.find();
    if(yearOfPassing!=null) {
      //String retVal = await OurDatabase().updateUserYearOfPassing(instance.currentUser?.uid ?? "",yearOfPassing);
      instance.currentUser?.yearOfPassing = yearOfPassing;
      instance.saveUpdatedUser();
      // if(retVal == "success") {
      //   // pass on the user to the branch selection page now
      //   Get.offAll(Home());
      // }else {
      //   // show the appropriate message to the user on the info about the error
      // }
    }
  }

  updateDetailsOfUser() async{
    final CurrentState instance = Get.find();
    String retVal = await OurDatabase().updateAllDetailsOfUser(instance.currentUser!);
    if(retVal == "success") {
      Get.offAll(() => Home());
    }
  }

}