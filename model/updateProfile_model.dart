class UpdateProfileResponseModel {
  final int status;

  UpdateProfileResponseModel({this.status});

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(status: json["status"]);
  }
}

class UpdateProfileRequestModel {
  String name;
  String phone;
  String gender;

  //constructor
  UpdateProfileRequestModel({
    this.name,
    this.phone,
    this.gender,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'phone': phone.trim(),
      'gender': gender,
    };

    return map;
  }
}

/*Trim Method:-
 If the string contains leading or trailing whitespace, 
a new string with no leading and no trailing whitespace is returned
*/
