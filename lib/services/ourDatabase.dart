import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_startup/models/collegeModel.dart';
import 'package:project_startup/models/ourUser.dart';

import '../models/pendingRequestModel.dart';

class OurDatabase {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
      retVal = "success"; // commit
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      // this block is running fine
      DocumentSnapshot _docSnapshot =
      await _firestore.collection("users").doc(uid).get();
      if(_docSnapshot.exists) {
        print("Above the document snapshot data");
        print(_docSnapshot.data());
        print("below the document snapshot data");
        //retVal(_docSnapshot.data()['name']);

        if(_docSnapshot.data()!=null) {
          Map<String, dynamic>? data = (_docSnapshot.data()) as Map<String, dynamic>?;
          retVal = OurUser.fromJson(_docSnapshot.data() as Map<String, dynamic>);
        } else {

        }


        print("Exiting the get user information function now");
      } else {
        retVal.navigationThing = "doc-not-exist";
      }

    } catch (e) {
      print("in the catch of the get user info");
      print(e);
    }
    return retVal;
  }

  // Future<String> updateUserData(OurUser user, {File? file}) async {
  //   String retVal = "error";
  //
  //   try {
  //     String downloadLink;
  //     if (file != null) {
  //       var snapshot =
  //       await FirebaseStorage.instance.ref(user.uid).putFile(file);
  //       downloadLink = await snapshot.ref.getDownloadURL();
  //
  //       user.resume = downloadLink;
  //       await _firestore
  //           .collection("users")
  //           .doc(user.uid)
  //           .update(user.toJson());
  //       retVal = "success";
  //     } else {
  //       await _firestore
  //           .collection("users")
  //           .doc(user.uid)
  //           .update(user.toJson());
  //       retVal = "success";
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //
  //   return retVal;
  // }


  /// have to decide on what database design to implement here
  /// gonna be a complex one
  Future<List<CollegeModel>> fetchUniversities() async{
    List<CollegeModel> retVal = [];
    try{
      var snap = await _firestore.collection("collegeNames").doc("colleges").get();
      snap.data()?["allColleges"]?.forEach((value) {
        retVal.add(CollegeModel.fromJson(value));
      });
    }catch(e) {
      print("something went wrong");
      print(e);
    }

    return retVal;
  }


  /// this is used to update the college of the user in 3 parts of the database
  Future<String> updateUserCollege(String collegeId,String userId) async{
    String retVal = "error";

    final batch = _firestore.batch();

    try{
      var doc1 = _firestore.collection("college").doc(collegeId);

      batch.update(doc1,{
        "users": FieldValue.arrayUnion([userId])
      });

      var doc2 = _firestore.collection("users").doc(userId);

      batch.update(doc2, {
        "universityId":collegeId,
      });

      await batch.commit();
      retVal = "success";
    }catch(e) {
      print(e);
    }


    return retVal;
  }



  Future<String> updateAllDetailsOfUser(OurUser currentUser) async{
    String retVal = "error";

    try{
      _firestore.collection("users").doc(currentUser.uid).update({
        "yearOfPassing":currentUser.yearOfPassing,
        "branch":currentUser.branch,
        "universityId":currentUser.universityId,
        "universityName":currentUser.universityName,
      });

      retVal = "success";
    }catch(e) {

      print(e);
      print("something went wrong");
    }


    return retVal;
  }


  Future<String> updateUserBranch(String userId,String branch) async{
    String retVal = "error";
    try {
      await _firestore.collection("users").doc(userId).update({
        "branch":branch,
      });
      retVal = "success";
    }catch(e) {
      print(e);
    }
    return retVal;
  }
  
  Future<String> updateUserYearOfPassing(String userId,int yearOfPassing) async{
    String retVal = "error";
    try{
      await _firestore.collection("users").doc(userId).update({
        "yearOfPassing" : yearOfPassing,
      });

      retVal = "success";
    }catch(e) {
      print(e);
    }
    return retVal;
  }


  /// Step 1. Update the pending request array of the user
  /// Step 2. Add metadata in the new document of the user that includes the dateTime,
  /// Step 3. update the received request array of the sent user
  /// TODO :Step 4. Add metadata in the new document of the received request collection --- dekhte hai if needed to krr lenge
  /// All this time show loading to the user and then update the UI immediately
  Future<String> sendConnectionRequestProcess(String uidUser, String uidFriend) async {
    String retVal = "error";

    final batch = _firestore.batch();


    try{
      /// Step 1:
      var userPendingDoc = _firestore.collection("users").doc(uidUser);
      batch.update(userPendingDoc, {
        "pending":FieldValue.arrayUnion([uidFriend])
      });

      /// Step 2:
      /// create a doc with uid of the userFriend which will later be transferred to the approved section or deleted all together
      var userMetaData = _firestore.collection("users").doc(uidUser).collection("pending").doc(uidFriend);
      PendingRequestModel sendRequest = PendingRequestModel(friendUid:uidFriend,requestSentTime:DateTime.now());
      batch.set(userMetaData, sendRequest.toJson());

      /// Step 3:
      var friendPendingDoc = _firestore.collection("users").doc(uidFriend);
      batch.update(friendPendingDoc, {
        "received":FieldValue.arrayUnion([uidUser])
      });

      await batch.commit();
      retVal = "success";
    }catch(e) {
      print(e);
    }

    return retVal;
  }
}