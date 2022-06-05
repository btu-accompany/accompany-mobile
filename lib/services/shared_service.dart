import 'dart:ffi';

import 'package:accompany/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService{

  late final _prefs;

  SharedService() {
    initSharedPreferences();
}

  void initSharedPreferences() async {
    
    _prefs = await SharedPreferences.getInstance();
  }

  void setLoginDetails(String token) async{
    
    await _prefs.setString('token', token);
  }

  bool isLoggedin() {
    final String? token = _prefs.getString('token');

    if(token != null){
      return true;
    }
    else{
      return false;
    }
  }

  void logOut(BuildContext context) async{

    final success = await _prefs.remove('token');

    if(success){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginView(),), (route) => false);
    }
  }


}