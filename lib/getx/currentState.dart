import 'package:get/get.dart';
import 'package:project_startup/screens/homeScreen/demoHome.dart';
import 'package:project_startup/screens/loginScreen/our_login.dart';
import 'package:project_startup/services/localStorage.dart';

import '../models/ourUser.dart';

class CurrentState extends GetxController {


  final LocalStorage localStorage = LocalStorage();
  OurUser ?currentUser = OurUser();




  navigateUserToTheDesiredScreen() async{
    currentUser = await localStorage.getOurUser();


    Get.offAll(OurLoginPage());
    return;
    if(currentUser == null) {
      // Navigate the user to the Login Screen
      Get.offAll(OurLoginPage());

    } else {
      if(currentUser?.uid== null) {
        Get.offAll(OurLoginPage());
      }else {
        // Navigate the user to the home screen()
        Get.offAll(Home());

      }
    }
  }






}