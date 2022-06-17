import 'dart:io';

import 'package:accompany/features/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/shared_service.dart';
import '../tabs/tabs_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isLoggedin() {
    if (SharedPrefHelper.prefInstance.checkExists("token")) {
      return true;
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => AccompanyTabView(),
      //     ),
      //     (route) => false);
    } else {
      return false;
      // Fluttertoast.showToast(
      //     msg: "Account does not exist",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      bool result = isLoggedin();
      result
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AccompanyTabView()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/accompany_logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          if (Platform.isIOS)
            const CupertinoActivityIndicator(
              radius: 20,
            )
          else
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
        ],
      )),
    );
  }
}
