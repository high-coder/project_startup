import 'package:hive/hive.dart';

part 'ourUser.g.dart';

/// The user can signup using google and also with email and password
@HiveType(typeId: 123, adapterName: "OurUserDetailOriginal")
class OurUser {
  @HiveField(0)
  String? uid;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? name;




  /// from the map to convert the data back into the normal form
  factory OurUser.fromJson(Map<String, dynamic> data) {
    return OurUser(
      uid: data['uid'],
      email: data['email'],
      name: data["name"],

    );
  }

  /// this will be used to save the map data in the firebase database
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name":name,
    };
  }

  OurUser(
      {
        this.email,
        this.name,
        this.uid,
        });
}
