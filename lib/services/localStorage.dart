import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_startup/hiveDb/hiveBoxes.dart';
import 'package:project_startup/models/ourUser.dart';
import 'package:project_startup/services/pritingService.dart';

/// Created by highcoder on 6:37 pm
/// this class will just be used for the purpose of reading and writing data into local storage




class LocalStorage {
  void setLoggedIn({required OurUser user}) {
    var _userBox = Boxes.getUserBox();
    if (_userBox.isNotEmpty) {
      _userBox.put('user', user);
      Logger.logS('User stored in local Storage', 'localstorage');
    } else {
      Logger.logE('Error storing user ', 'localstorage');
    }
  }

  getOurUser() {
    try {
      var _userBox = Boxes.getUserBox();
      OurUser ourUser = _userBox.get('user')!;
      return OurUser;
    } catch (e) {
      print(e);

      return null;
    }
  }

  deleteOurUser() async{
    try{
      var _userBox = Boxes.getUserBox();
      OurUser ourUser = OurUser(
        name: "",
        uid: "",
        email: "",
      );
      await _userBox.put("user",ourUser);
    }catch(e) {
      print(e);
    }
  }

}