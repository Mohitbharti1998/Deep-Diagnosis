class LoginResponseModel {
  final String token;
  final int status;
  final int id;

  LoginResponseModel({this.token,this.id, this.status});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(

        token: json["token"] != null ? json['token'] : "",
        id: json["id"] != -1 ? json['id'] : -1,
        status: json["status"] != -1 ? json["status"] : -1);
  }
}

class LoginRequestModel {
  String email;
  String password;

  //constructor
  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

/*Trim Method:-
 If the string contains leading or trailing whitespace, 
a new string with no leading and no trailing whitespace is returned
*/
