import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_startup/getx/authController.dart';
import 'package:project_startup/getx/homePageController.dart';
import 'package:project_startup/getx/screenDisable.dart';
import 'package:project_startup/getx/userDataController.dart';

import '../getx/currentState.dart';

/// This is the splash screen of the application which will
/// also direct the user to the particular page

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final CurrentState stateController = Get.put(CurrentState());

  final UserDataControllerGet data = Get.put(UserDataControllerGet());
  final AuthService auth = Get.put(AuthService());
  final HomePageController home = Get.put(HomePageController());
  final ScreenDisableController sc = Get.put(ScreenDisableController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stateController.navigateUserToTheDesiredScreen();
    //auth.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //9041842831
        );
  }
}
