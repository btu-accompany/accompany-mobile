import 'package:accompany/features/login/login_view_model.dart';
import 'package:accompany/features/register/register.dart';
import 'package:flutter/material.dart';

import '../tabs/tabs_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    var ekranBoyutu = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/accompanytema.png',
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(70), // Image radius
                  child: const Image(
                    image: AssetImage(
                      'assets/accompany_logo.png',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 1,
                      controller: phoneNumberController,
                      obscureText: false,
                      onChanged: null,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 1,
                      controller: passwordController,
                      obscureText: true,
                      onChanged: null,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                        loginSendButton();     
                    },
                    child: const Text("Log In"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade200,
                      onPrimary: Colors.blue.shade800,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Colors.grey.shade200),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: const Text('Do not have an account ?'),
                  ),
                  SizedBox(
                    width: ekranBoyutu.width * 0.9,
                    child: Divider(
                      color: Colors.grey.shade200,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "Accompany",
                    style: TextStyle(color: Colors.grey.shade200),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
