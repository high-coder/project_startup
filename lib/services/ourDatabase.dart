import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_startup/models/collegeModel.dart';
import 'package:project_startup/models/ourUser.dart';

class OurDatabase {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
      retVal = "success";
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
      print("Above the document snapshot data");
      print(_docSnapshot.data());
      print("below the document snapshot data");
      //retVal(_docSnapshot.data()['name']);

      Map<String, dynamic>? data = _docSnapshot.data() as Map<String, dynamic>?;
      retVal = OurUser.fromJson(_docSnapshot.data() as Map<String, dynamic>);

      print("Exiting the get user information function now");
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
        "collegeId":collegeId,
      });

      await batch.commit();
      retVal = "success";
    }catch(e) {
      print(e);
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
}