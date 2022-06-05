import 'dart:io';
import 'package:accompany/features/login/login.dart';
import 'package:accompany/features/register/register.dart';
import 'package:accompany/models/register_user_model.dart';
import 'package:accompany/services/register_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

abstract class RegisterViewModel extends State<RegisterView> {
late String? fcmToken;

  Future<String?> getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();

    return fcmToken;
  }

  initToken() async {
    fcmToken = await getToken();
  }
  
  String dropdownValue = 'General';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> departmanlar = [
      "Department",
      "Human Resources",
      "Finance",
      "Marketing",
      "Stuff"
    ];
  String? selectedItem = "Department";
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    initToken();
    registerService = RegisterService();
  }

  late final RegisterService registerService;

  Future<void> RegistersendButtonClicked() async {

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

        if (nameController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter your name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }


    if (surnameController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter your surname",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }


    if (emailController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter your email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }


    if (addressController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter your adress",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }


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


    final model = RegisterUserModel(
        name: nameController.value.text.toString(),
        phoneNumber: phoneNumberController.value.text.toString(),
        ppUrl: "https://i.pinimg.com/474x/8f/1b/09/8f1b09269d8df868039a5f9db169a772.jpg",
        password: passwordController.value.text.toString(),
        address: addressController.value.text.toString(),
        email: emailController.value.text.toString(),
        surname: surnameController.value.text.toString(),
        fcmToken: fcmToken,
        departmant: selectedItem,
        role: "basic"
        );
        
        try {
        postRegister(model).then((value) {
      
          Fluttertoast.showToast(
          msg: "Please login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
        });
    
        } on DioError catch (e) { 
          
          if(e.response?.statusCode == 409){
            print(e.response?.statusCode);
          }
        }
  }
    
  Future<void> postRegister(RegisterUserModel model) async {
    _toggleLoading();
    var result = await registerService.PostRegister(model);
    if(!result){
      
      throw new UserAlreadyExistException("This number/email has already taken");
    
    }
    _toggleLoading();
  }
}

class UserAlreadyExistException implements Exception {
  String cause;
  UserAlreadyExistException(this.cause);
}


