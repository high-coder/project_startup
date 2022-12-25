import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project_startup/getx/userDataController.dart';
import 'package:project_startup/screens/dataCollection/userDataCollection.dart';
import 'package:project_startup/screens/dataCollection/yearOfPassing.dart';
import 'package:project_startup/screens/homeScreen/demoHome.dart';
import 'package:project_startup/screens/loginScreen/our_login.dart';
import 'package:project_startup/services/localStorage.dart';

import '../models/ourUser.dart';
import '../screens/exploreUsers/allUsers.dart';

class CurrentState extends GetxController {
  final LocalStorage localStorage = LocalStorage();
  OurUser? currentUser = OurUser();

  navigateUserToTheDesiredScreen() async {
    currentUser = await localStorage.getOurUser();
    UserDataControllerGet user = Get.find();

    //
    //Get.offAll(UserDataCollection(0));
    //return;
<<<<<<< HEAD
    if (currentUser == null) {
=======
    return       Get.offAll(() =>  UserDataCollection(0));
;
    if(currentUser == null) {
>>>>>>> e742bf0f00986769ed71e0698933dcf6ada305c1
      // Navigate the user to the Login Screen
      Get.offAll(() => const OurLoginPage());
    } else {
<<<<<<< HEAD
      if (currentUser?.uid == null) {
        Get.offAll(() => const OurLoginPage());
      } else if (currentUser?.universityId == null) {
        // Navigate the user to the home screen()
        //Get.offAll(Home());
        return Get.offAll(UserDataCollection(0));
      } else if (currentUser?.branch == null) {
        // user.stepTwoAnimationOneUniName();
        // user.state.value=1;
        return Get.offAll(() => UserDataCollection(1));
      } else if (currentUser?.yearOfPassing == null) {
        return Get.offAll(const YearOfPassing());
      } else {
        // lets see
        return Get.offAll(() => AllUsers());
=======
      if(currentUser?.uid== null) {
        Get.offAll(()=> const OurLoginPage());
      }else if(currentUser?.universityId==null){
        // Navigate the user to the home screen()
        //Get.offAll(Home());
        return Get.offAll(()=> UserDataCollection(0));

      } else if(currentUser?.branch == null) {
        // user.stepTwoAnimationOneUniName();
        // user.state.value=1;
        return Get.offAll(() => UserDataCollection(1));
      } else if(currentUser?.yearOfPassing == null) {
        return Get.offAll(()=> const YearOfPassing());
      }
      else {
        // lets see
        return Get.offAll(()=> Home());
>>>>>>> e742bf0f00986769ed71e0698933dcf6ada305c1
      }
    }
  }

  /// used to save the updated user data in the application
  saveUpdatedUser() async {
    localStorage.setLoggedIn(user: currentUser!);
  }

  /// this function will be used to send the connection request to the user
  sendConnectionRequest() async {}

  var snaps;
  fetchAllUserUsingPaginationMate() async {
    snaps = FirebaseFirestore.instance
        .collection("users")
        .orderBy('name', descending: true)
        .withConverter<OurUser>(
            fromFirestore: (snapshot, _) => OurUser.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson())
        .limit(10);

    //return snaps;
  }

  List<OurUser> allUsers = [];
  List<DocumentSnapshot> documentList = [];

  /// It will fetch the first 10 users to display in the application
  fetchFirstSetOfUsers() async {
    try {
      var documentList = (await FirebaseFirestore.instance
              .collection("users")
              .where("universityId", isEqualTo: currentUser?.universityId)
              .orderBy("name")
              .limit(10)
              .get())
          .docs;
      print(documentList.length);
      for (var element in documentList) {
        print(element.data());
        allUsers.add(OurUser.fromJson(element.data()));
      }
      update();
      //movieController.sink.add(documentList);
    } on SocketException {
      //movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      //movieController.sink.addError(e);
    }
  }

  /// this function will be called again and again to fetch new users
  fetchNextUsers() async {
    try {
      //updateIndicator(true);
      List<DocumentSnapshot> newDocumentList = (await FirebaseFirestore.instance
              .collection("users")
              .orderBy("name")
              .where("universityId", isEqualTo: currentUser?.universityId)
              .startAfterDocument(documentList[documentList.length - 1])
              .limit(10)
              .get())
          .docs;
      documentList.addAll(newDocumentList);
      //movieController.sink.add(documentList);
    } on SocketException {
      //movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      //lvd
      //movieController.sink.addError(e);
    }
  }
}
