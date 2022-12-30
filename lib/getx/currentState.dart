import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project_startup/getx/screenDisable.dart';
import 'package:project_startup/getx/userDataController.dart';
import 'package:project_startup/screens/dataCollection/userDataCollection.dart';
import 'package:project_startup/screens/dataCollection/yearOfPassing.dart';
import 'package:project_startup/screens/homeScreen/demoHome.dart';
import 'package:project_startup/screens/loginScreen/our_login.dart';
import 'package:project_startup/services/localStorage.dart';
import 'package:project_startup/services/ourDatabase.dart';

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
    if (currentUser == null) {
      // Navigate the user to the Login Screen
      Get.offAll(() => const OurLoginPage());
    } else {
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
        return Get.offAll(() => Home());
      }
    }
  }

  /// used to save the updated user data in the application
  saveUpdatedUser() async {
    localStorage.setLoggedIn(user: currentUser!);
  }

  /// this function will be used to send the connection request to the user
  sendConnectionRequest(String uidConnection, int index) async {
    String retVal = await OurDatabase()
        .sendConnectionRequestProcess(currentUser?.uid ?? "", uidConnection);
    if (retVal == "success") {
      // here change the ui of the application
      allUsers[index].relation = "Pending";
      if (currentUser?.pending != null) {
        currentUser?.pending?.add(uidConnection);
      } else {
        currentUser?.pending = [];
        currentUser?.pending?.add(uidConnection);
        update();
      }
    }
  }

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

  // from here fetch all sets of the users
  runMeAtFirst() async {
    currentUser = await OurDatabase().getUserInfo(currentUser?.uid ??
        ""); // this will give us the updated data of the user
    print("here printing the p[endingn user of hte palication");
    print(currentUser?.received);
    await fetchFirstSetOfUsers();
    //await fetchNextUsers();
    update();
  }

  /// It will fetch the first 10 users to display in the application
  fetchFirstSetOfUsers() async {
    allUsers.clear();
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
        if (element.data()["uid"] == currentUser?.uid) {
        } else {
          allUsers.add(OurUser.fromJson(element.data()));
        }
      }
      sortEverythingHereMan(0);
      update();
      //movieController.sink.add(documentList);
    } on SocketException {
      //movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      //movieController.sink.addError(e);
    }
  }

  sortEverythingHereMan(int startAt) {
    // here i have to loop through the pending and received and friends list

    List friends = currentUser?.friends ?? [];
    for (var element in allUsers) {
      print("entering the top level loop");
      bool breakOuter = false;
      for (var uidMatch in friends) {
        if (element.uid == uidMatch) {
          element.relation = "Friend";
          breakOuter = true;
          //continue;
          break;
        }
      }
      if (breakOuter == true) {
        continue;
      }
      List pending = currentUser?.pending ?? [];
      for (var uidMatch in pending) {
        if (element.uid == uidMatch) {
          print("matching here to the pending thing");
          element.relation = "Pending";
          breakOuter = true;
          break;
        }
      }
      if (breakOuter == true) {
        continue;
      }

      List recieved = currentUser?.received ?? [];
      for (var uidMatch in recieved) {
        if (element.uid == uidMatch) {
          element.relation = "Received";
          breakOuter = true;
          break;
        }
      }
      if (breakOuter == true) {
        continue;
      }
    }

    update();
  }

  /// this function will be called again and again to fetch new users
  fetchNextUsers() async {
    try {
      print("Entering the functions");
      //updateIndicator(true);
      var newDocumentList = (await FirebaseFirestore.instance
              .collection("users")
              .orderBy("name")
              .where("universityId", isEqualTo: currentUser?.universityId)
              .startAfterDocument(documentList[documentList.length])
              .limit(10)
              .get())
          .docs;
      documentList.addAll(newDocumentList);
      print(newDocumentList.length);
      for (var element in newDocumentList) {
        print(element.data());
        allUsers.add(OurUser.fromJson(element.data()));
      }
      sortEverythingHereMan(0);
      //movieController.sink.add(documentList);
    } on SocketException {
      //movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      //lvd
      //movieController.sink.addError(e);
    }
  }

  /// this will be used to fetch allConnections of the user -----------
  //List<DocumentSnapshot> connectionDocumentsList = [];
  List<OurUser> connectionsList = [];
  fetchConnections(int start) async {
    /// then I will have to fetch the details of the user one by one
    ///
    if (currentUser?.friends != null) {
      print(currentUser?.friends?.length);
      // send the ids for fetching 10 at a time
      int length = currentUser?.friends?.length ?? 0;
      int end = length;
      if (length > 10) {
        // here send the first 10 ids for fetching
        if (start < length) {
        } else {
          start = length - 1;
        }
        if (start + 10 < length) {
          end = start + 10;
        } else {
          end = length;
        }
        currentUser?.friends?.getRange(start, end).forEach((element) async {
          var data = await FirebaseFirestore.instance
              .collection("users")
              .doc(element)
              .get();
          connectionsList.add(OurUser.fromJson(data.data() ?? {}));
        });
      } else {
        currentUser?.friends?.forEach((element) async {
          var data = await FirebaseFirestore.instance
              .collection("users")
              .doc(element)
              .get();
          connectionsList.add(OurUser.fromJson(data.data() ?? {}));
        });
      }
    } else {
      print("The user has no friends he/she is lonely");
    }
  }

  List<OurUser> receivedList = [];
  fetchRequests(int start) async {
    /// I will have the list of the friends of the user in the currentUser and
    /// then I will have to fetch the details of the user one by one
    ///
    if (currentUser?.received != null) {
      print(currentUser?.received?.length);
      // send the ids for fetching 10 at a time
      int length = currentUser?.received?.length ?? 0;
      int end = length;
      if (length > 10) {
        // here send the first 10 ids for fetching
        if (start < length) {
        } else {
          start = length - 1;
        }
        if (start + 10 < length) {
          end = start + 10;
        } else {
          end = length;
        }
        currentUser?.received?.getRange(start, end).forEach((element) async {
          var data = await FirebaseFirestore.instance
              .collection("users")
              .doc(element)
              .get();
          receivedList.add(OurUser.fromJson(data.data() ?? {}));
        });
      } else {
        currentUser?.received?.forEach((element) async {
          var data = await FirebaseFirestore.instance
              .collection("users")
              .doc(element)
              .get();
          receivedList.add(OurUser.fromJson(data.data() ?? {}));
        });
      }
    } else {
      print("The user has no friends he/she is lonely");
    }
  }

  List<OurUser> pendingConnections = [];
  fetchSentConnectionRequests(int start) async {
    /// I will have the list of the friends of the user in the currentUser and
    /// then I will have to fetch the details of the user one by one
    ///
    if (currentUser?.pending != null) {
      print(currentUser?.pending?.length);
      // send the ids for fetching 10 at a time
      int length = currentUser?.pending?.length ?? 0;
      int end = length;
      if (length > 10) {
        // here send the first 10 ids for fetching
        if (start < length) {
        } else {
          start = length - 1;
        }
        if (start + 10 < length) {
          end = start + 10;
        } else {
          end = length;
        }
        currentUser?.pending?.getRange(start, end).forEach((element) async {
          var data = await FirebaseFirestore.instance
              .collection("users")
              .doc(element)
              .get();
          pendingConnections.add(OurUser.fromJson(data.data() ?? {}));
        });
      } else {
        currentUser?.pending?.forEach((element) async {
          var data = await FirebaseFirestore.instance
              .collection("users")
              .doc(element)
              .get();
          pendingConnections.add(OurUser.fromJson(data.data() ?? {}));
        });
      }
    } else {
      print("The user has no friends he/she is lonely");
    }

    //update();
  }

  // this will be used to accept or reject a connection request
  actionOnConnectionRequest(String decision, int index) async {
    disableScreen(true);
    print("Calling the function here");
    await OurDatabase()
        .actionOnConnReq(decision, currentUser!, receivedList[index]);

    // TODO: if the function returns with success then update the list as well

    disableScreen(false);
    print("The function is over now");
  }

  disableScreen(bool value) {
    ScreenDisableController controller = Get.find();
    controller.disableScreen.value = value;
  }
}
