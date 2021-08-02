class PlaceOrderResponseModel {
  final int status;

  PlaceOrderResponseModel({this.status});

  factory PlaceOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderResponseModel(
        status: json["status"] != -1 ? json["status"] : -1);
  }
}

class PlaceOrderRequestModel {
  String name;
  String age;
  String time;
  String date;
  String address;
  String pincode;
  String payment;

  //constructor
  PlaceOrderRequestModel({
    this.name,
    this.age,
    this.time,
    this.date,
    this.address,
    this.pincode,
    this.payment,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'patient_name': name,
      'patient_age': age,
      'time': time,
      'date': date,
      'address': address,
      'pincode': pincode,
      'mode_of_payment': payment,
    };

    return map;
  }
}
