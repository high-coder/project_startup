class PendingRequestModel {
  String friendUid;
  DateTime requestSentTime;


  PendingRequestModel({required this.friendUid, required this.requestSentTime});


  factory PendingRequestModel.fromJson(Map<String, dynamic> data) {
    return PendingRequestModel(
      friendUid:data["friendUid"],
      requestSentTime : data["requestSentTime"].toDate(),
    );
  }

  /// this will be used to save the map data in the firebase database
  Map<String, dynamic> toJson() {
    return {
      "friendUid":friendUid,
      "requestSendTime":requestSentTime,
    };
  }
}