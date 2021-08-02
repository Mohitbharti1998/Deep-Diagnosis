class UpdateOrderDetailsResponseModel {
  final int status;

  UpdateOrderDetailsResponseModel({this.status});

  factory UpdateOrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderDetailsResponseModel(status: json["status"]);
  }
}

class UpdateOrderDetailsRequestModel {
  String time;
  String date;
  String address;
  String pincode;

  //constructor
  UpdateOrderDetailsRequestModel({
    this.time,
    this.date,
    this.address,
    this.pincode,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'time': time,
      'date': date,
      'address': address,
      'pincode': pincode
    };

    return map;
  }
}

/*Trim Method:-
 If the string contains leading or trailing whitespace, 
a new string with no leading and no trailing whitespace is returned
*/
