import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_startup/models/ourUser.dart';

class Boxes {
  static Box<OurUser> getUserBox() => Hive.box<OurUser>('user');
}

initBoxes() {
  if (!Boxes.getUserBox().containsKey('user')) {
    OurUser authUser = OurUser(
        name: "",
        uid: "",
        email: "",
    );

    Boxes.getUserBox().put('user', authUser);
  }
}
