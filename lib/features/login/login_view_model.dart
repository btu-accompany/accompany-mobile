import 'package:accompany/features/login/login.dart';
import 'package:accompany/features/tabs/tabs_view.dart';
import 'package:accompany/models/contact_model.dart';
import 'package:accompany/models/login_request_model.dart';
import 'package:accompany/services/contact_service.dart';
import 'package:accompany/services/login_request_service.dart';
import 'package:accompany/services/shared_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginViewModel extends State<LoginView> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late final LoginService _loginService;
  late final ContactService _contactService;
  //final SharedService _sharedService = SharedService();
  bool _isLoading = false;

  @override
  void initState() {
    _loginService = LoginService();
    // isLoggedin();
    super.initState();
  }

  // void isLoggedin() async {
  //   if (SharedPrefHelper.prefInstance.checkExists("token")) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => AccompanyTabView(),
  //         ),
  //         (route) => false);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Account does not exist",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void loginSendButton() async {
    if (phoneNumberController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter your phone number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }

    if (passwordController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter your password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }

    final model = LoginRequestModel(
      phoneNumber: phoneNumberController.value.text.toString(),
      password: passwordController.value.text.toString(),
    );

    try {
      var result = await postLogin(model);
      if (result != null) {
        //* tokeni burada kayıt ediyoruz
        await SharedPrefHelper.prefInstance.setString("token", result);
        ContactModel? contactModel = await fetchUser(model.phoneNumber ?? "");

        if (contactModel != null) {
          await SharedPrefHelper.prefInstance
              .setString("name", contactModel.name ?? "");
          await SharedPrefHelper.prefInstance
              .setString("surname", contactModel.surname ?? "");
          await SharedPrefHelper.prefInstance
              .setString("departman", contactModel.departmant ?? "");
          await SharedPrefHelper.prefInstance
              .setString("mail", contactModel.email ?? "");
          await SharedPrefHelper.prefInstance
              .setString("address", contactModel.address ?? "");
          await SharedPrefHelper.prefInstance
              .setString("phoneNumber", contactModel.phoneNumber ?? "");
          await SharedPrefHelper.prefInstance
              .setString("phoneNumber", contactModel.phoneNumber ?? "");
          await SharedPrefHelper.prefInstance
              .setString("fcmToken", contactModel.fcmToken ?? "");
          await SharedPrefHelper.prefInstance
              .setString("ppUrl", contactModel.ppUrl ?? "");
          await SharedPrefHelper.prefInstance
              .setString("_id", contactModel.id ?? "");
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccompanyTabView(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Please check your informations",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ContactModel?> fetchUser(String phoneNumber) async {
    _toggleLoading();
    _contactService = ContactService();
    var result = await _contactService.fetchByPhoneNumber(phoneNumber);
    _toggleLoading();
    return result;
  }

  Future<String?> postLogin(LoginRequestModel model) async {
    _toggleLoading();
    var result = await _loginService.login(model);
    _toggleLoading();
    return result;
  }
}
