import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_startup/services/localStorage.dart';
import 'package:project_startup/services/ourDatabase.dart';

import '../models/ourUser.dart';

class AuthService extends GetxController{
  final _auth = FirebaseAuth.instance;
  final LocalStorage localStorage = LocalStorage();

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    OurUser currentUser = OurUser();


    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication? _googleAuth =
      await _googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth?.idToken,
          accessToken: _googleAuth?.accessToken);
      UserCredential _authResult =
      await _auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo?.isNewUser ?? false) {
        currentUser.email = _authResult.user?.email;
        currentUser.name = _authResult.user?.displayName;
        currentUser.uid = _authResult.user?.uid;
        //print(_authResult.user.e)
        print(currentUser.uid);
        print(_authResult.user?.uid);
        String retVal34 = await OurDatabase().createUser(currentUser);
        retVal = retVal34;
        // this will then save the data of the user in the local database
        if (retVal34 == "success") {

          localStorage.setLoggedIn(user: currentUser);
          //userBox.put("data", currentUser);

        } else {
          // in an actually correct application i should either delete the account of the user or do something about it
        }
      } else {
        currentUser.uid = _authResult.user?.uid;
        print("this is an old user so lets welcome him/her");
        // get the information of the user from the database this already exists
        currentUser = await OurDatabase().getUserInfo(currentUser.uid ?? "");
        print(currentUser.toJson());
        print("-------------------------------------------");
        if (currentUser.uid != null) {
          retVal = "success";
          //userBox.put("data", currentUser);
          localStorage.setLoggedIn(user: currentUser);
        }
      }

    } on FirebaseAuthException catch (e) {
      retVal = "something went wrong";
      print(
          "Entering the catch block in the google signin function===========");
      print(e.message);
    }
      //print(retVal);

    return retVal;
  }


}