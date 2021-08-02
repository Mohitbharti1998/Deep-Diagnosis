class SignupResponseModel {
  final int status;

  SignupResponseModel({this.status});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
        status: json["status"] != -1 ? json["status"] : -1);
  }
}

class SignupRequestModel {
  String name;
  String email;
  String phone;
  String gender;
  String password;

  //constructor
  SignupRequestModel({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email.trim(),
      'phone': phone.trim(),
      'gender': gender.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

/*Trim Method:-
 If the string contains leading or trailing whitespace, 
a new string with no leading and no trailing whitespace is returned
*/
