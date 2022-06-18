import 'package:accompany/features/login/login.dart';
import 'package:accompany/features/tabs/tabs_view.dart';
import 'package:accompany/models/contact_model.dart';
import 'package:accompany/models/login_request_model.dart';
import 'package:accompany/services/contact_service.dart';
import 'package:accompany/services/login_request_service.dart';
import 'package:accompany/services/shared_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class LoginViewModel extends State<LoginView> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late final LoginService _loginService;
  ContactService? _contactService;
  bool _isLoading = false;

  @override
  void initState() {
    _contactService = ContactService();
    _loginService = LoginService();

    super.initState();
  }

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
        final newfcmToken = await FirebaseMessaging.instance.getToken();
        ContactModel? updatedUser = await updateUserForFcmToken(
            contactModel?.id ?? "", newfcmToken ?? "");

        if (contactModel != null) {
          await SharedPrefHelper.prefInstance
              .setString("name", updatedUser?.name ?? "");
          await SharedPrefHelper.prefInstance
              .setString("surname", updatedUser?.surname ?? "");
          await SharedPrefHelper.prefInstance
              .setString("departman", updatedUser?.departmant ?? "");
          await SharedPrefHelper.prefInstance
              .setString("mail", updatedUser?.email ?? "");
          await SharedPrefHelper.prefInstance
              .setString("address", updatedUser?.address ?? "");
          await SharedPrefHelper.prefInstance
              .setString("phoneNumber", updatedUser?.phoneNumber ?? "");
          await SharedPrefHelper.prefInstance
              .setString("phoneNumber", updatedUser?.phoneNumber ?? "");
          await SharedPrefHelper.prefInstance
              .setString("fcmToken", updatedUser?.fcmToken ?? "");
          await SharedPrefHelper.prefInstance
              .setString("ppUrl", updatedUser?.ppUrl ?? "");
          await SharedPrefHelper.prefInstance
              .setString("_id", updatedUser?.id ?? "");
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
    // _contactService = ContactService();
    var result = await _contactService?.fetchByPhoneNumber(phoneNumber);
    _toggleLoading();
    return result;
  }

  Future<ContactModel?> updateUserForFcmToken(
      String _id, String fcmToken) async {
    _toggleLoading();
    // _contactService = ContactService();
    var result = await _contactService?.updateFcmToken(_id, fcmToken);
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
