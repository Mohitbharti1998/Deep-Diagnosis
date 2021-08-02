import 'package:deep_diagnosis/Login/components/or_divider.dart';
import 'package:deep_diagnosis/Login/login_screen.dart';
import 'package:deep_diagnosis/Singup/components/background.dart';
import 'package:deep_diagnosis/api/api_service.dart';
import 'package:deep_diagnosis/components/ProgressHUD.dart';
import 'package:deep_diagnosis/components/already_have_an_account_acheck.dart';
import 'package:deep_diagnosis/components/rounded_button.dart';
import 'package:deep_diagnosis/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isHidden = true;

  bool _isHiiddenConfirm = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignupRequestModel signupRequestModel;

  String _password;

  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    signupRequestModel = new SignupRequestModel();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      _isHiiddenConfirm = !_isHiiddenConfirm;
    });
  }

  bool validateAndSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" DEEP ",
                  style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.white,
                      fontFamily: 'Megrim',
                      decoration: TextDecoration.none)),
              Text(" DIAGNOSIS ",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontFamily: 'Megrim',
                      decoration: TextDecoration.none)),
              SizedBox(height: size.height * 0.01),
              SizedBox(height: size.height * 0.013),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(29.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty)
                                    return 'Please Enter Your Name';
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (input) =>
                                    signupRequestModel.name = input),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.013),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(29.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty)
                                    return 'Please Enter Your Email';
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(input)) {
                                    return 'Please Enter Valid Email';
                                  }
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (input) =>
                                    signupRequestModel.email = input),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.013),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(29.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty)
                                    return 'Please Enter Phone Number';
                                  if (input.length != 10) {
                                    return 'Please Enter 10 digit Phone Number';
                                  }
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Phone NO',
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (input) =>
                                    signupRequestModel.phone = input),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.013),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(29.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty)
                                    return 'Please Enter Your Gender';
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Gender (Ex: Male/Female/Other)',
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.nature,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (input) =>
                                    signupRequestModel.gender = input),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.013),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(29.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: TextFormField(
                                validator: (input) {
                                  if (input.length < 5)
                                    return 'Please Provide Minimum 6 Character';
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                      color: Colors.black,
                                      icon: _isHidden
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                      onPressed: _togglePasswordView),
                                ),
                                obscureText: _isHidden,
                                onChanged: (input) {
                                  _password = input;
                                  signupRequestModel.password = input;
                                }),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.013),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(29.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: TextFormField(
                              validator: (input) {
                                if (input != _password)
                                  return 'Confimation password does not match the entered password';

                                return null;
                              },
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                    color: Colors.black,
                                    icon: _isHiiddenConfirm
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: _toggleConfirmPasswordView),
                              ),
                              obscureText: _isHiiddenConfirm,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RoundedButton(
                text: "SIGN UP",
                press: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  if (validateAndSave()) {
                    print(signupRequestModel.toJson());

                    setState(() {
                      isApiCallProcess = true;
                    });

                    APIService apiService = new APIService();
                    apiService.signup(signupRequestModel).then((value) async {
                      if (value != null) {
                        setState(() {
                          isApiCallProcess = false;
                        });

                        if (value.status == 1) {
                          _formKey.currentState.reset();

                          Fluttertoast.showToast(
                              msg: "User Registration Successful! Please Login",
                              toastLength: Toast.LENGTH_LONG);
                        } else {
                          _formKey.currentState.reset();
                          Fluttertoast.showToast(
                              msg: "User Already Registered! Please Login",
                              toastLength: Toast.LENGTH_LONG);
                          // showError("User Already Registered! Please Login");
                        }
                      }
                    });
                  }
                },
              ),
              OrDivider(),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
