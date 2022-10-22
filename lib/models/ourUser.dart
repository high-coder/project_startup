import 'package:hive/hive.dart';

part 'ourUser.g.dart';

/// The user can signup using google and also with email and password
@HiveType(typeId: 123, adapterName: "OurUserDetailOriginal")
class OurUser {
  @HiveField(0)
  String? uid;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? universityId;

  @HiveField(4)
  String? universityName;

  /// from the map to convert the data back into the normal form
  factory OurUser.fromJson(Map<String, dynamic> data) {
    return OurUser(
      uid: data['uid'],
      email: data['email'],
      name: data["name"],
      universityId:data["universityId"],
      universityName:data["universityName"],
    );
  }

  /// this will be used to save the map data in the firebase database
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name":name,
      "universityName":universityName,
      "universityId":universityId,
    };
  }

  OurUser(
      {
        this.email,
        this.name,
        this.uid,
        this.universityId,
        this.universityName
        });
}
