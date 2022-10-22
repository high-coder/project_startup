class CollegeModel {
  String name;
  String id;


  CollegeModel({required this.name,required this.id});

  factory CollegeModel.fromJson(Map<String,dynamic> json) {
    return CollegeModel(
      name: json["name"],
      id: json["id"],
    );
  }


}