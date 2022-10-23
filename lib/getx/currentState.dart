import 'package:get/get.dart';
import 'package:project_startup/screens/dataCollection/userDataCollection.dart';
import 'package:project_startup/screens/dataCollection/yearOfPassing.dart';
import 'package:project_startup/screens/homeScreen/demoHome.dart';
import 'package:project_startup/screens/loginScreen/our_login.dart';
import 'package:project_startup/services/localStorage.dart';

import '../models/ourUser.dart';

class CurrentState extends GetxController {


  final LocalStorage localStorage = LocalStorage();
  OurUser ?currentUser = OurUser();




  navigateUserToTheDesiredScreen() async{
    currentUser = await localStorage.getOurUser();

    //
    Get.offAll(UserDataCollection());
    return;
    if(currentUser == null) {
      // Navigate the user to the Login Screen
      Get.offAll(OurLoginPage());

    } else {
      if(currentUser?.uid== null) {
        Get.offAll(()=>const OurLoginPage());
      }else if(currentUser?.universityId==null){
        // Navigate the user to the home screen()
        //Get.offAll(Home());
      return Get.offAll(UserDataCollection());

      } else if(currentUser?.yearOfPassing == null) {
        return Get.offAll(YearOfPassing());
      }
      else {
        // lets see
        return Get.offAll(Home());
      }
    }
  }



  /// used to save the updated user data in the application
  saveUpdatedUser() async{
    localStorage.setLoggedIn(user: currentUser!);
  }







}