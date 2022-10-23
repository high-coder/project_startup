import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_startup/hiveDb/hiveBoxes.dart';
import 'package:project_startup/models/ourUser.dart';
import 'package:project_startup/services/pritingService.dart';

/// Created by highcoder on 6:37 pm
/// this class will just be used for the purpose of reading and writing data into local storage




class LocalStorage {
  void setLoggedIn({required OurUser user}) async{
    Box _userBox = await Hive.openBox("userDetails");
    //if (_userBox.isNotEmpty) {
      _userBox.put('user', user);
      Logger.logS('User stored in local Storage', 'localstorage');
    //}
    //else {
      //Logger.logE('Error storing user ', 'localstorage');
    //}
  }

  getOurUser() async{
    try {
      Box _userBox = await Hive.openBox("userDetails");

      OurUser ourUser = _userBox.get('user')!;
      return ourUser;
    } catch (e) {
      print(e);

      return null;
    }
  }

  deleteOurUser() async{
    try{
      Box _userBox = await Hive.openBox("userDetails");

      OurUser ourUser = OurUser(
        name: "",
        uid: "",
        email: "",
      );
      await _userBox.delete("user");
    }catch(e) {
      print(e);
    }
  }

}