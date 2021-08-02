import 'package:deep_diagnosis/model/login_model.dart';
import 'package:deep_diagnosis/model/place_order.dart';
import 'package:deep_diagnosis/model/signup_model.dart';
import 'package:deep_diagnosis/model/updateOrderDetails_model.dart';
import 'package:deep_diagnosis/model/updateProfile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "http://deepdiagnosis.pythonanywhere.com/login";

    final response = await http.post(url, body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<SignupResponseModel> signup(
      SignupRequestModel signupRequestModel) async {
    String url = "http://deepdiagnosis.pythonanywhere.com//signup";

    final response = await http.post(url, body: signupRequestModel.toJson());

    if (response.statusCode == 200) {
      return SignupResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<PlaceOrderResponseModel> order(
      PlaceOrderRequestModel placeOrderRequestModel,
      int userId,
      int companyId) async {
    String url =
        "https://deepdiagnosis.pythonanywhere.com/place_order/$userId/$companyId";

    final response =
        await http.post(url, body: placeOrderRequestModel.toJson());

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return PlaceOrderResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<UpdateProfileResponseModel> updateProilfe(
      UpdateProfileRequestModel requestModel, int id) async {
    String url = "http://deepdiagnosis.pythonanywhere.com/update_profile/$id";

    final response = await http.post(url, body: requestModel.toJson());

    if (response.statusCode == 200) {
      return UpdateProfileResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<UpdateOrderDetailsResponseModel> updateOrder(
      UpdateOrderDetailsRequestModel requestModel, int orderId) async {
    String url =
        "http://deepdiagnosis.pythonanywhere.com/update_order/$orderId";

    final response = await http.post(url, body: requestModel.toJson());

    if (response.statusCode == 200) {
      return UpdateOrderDetailsResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
