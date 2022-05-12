import 'dart:io';

import 'package:flutter/material.dart';

class ContactsDetails extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ContactsDetails({Key? key}) : super(key: key);

  @override
  State<ContactsDetails> createState() => _ContactsDetails();
}

class _ContactsDetails extends State<ContactsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/accompany_logo.png"),
            ),
          ),
          InfoTextArea(context, "Kerem Ersu"),
          InfoTextArea(context, "Software"),
          InfoTextArea(context, "kerem@gmail.com"),
          InfoTextArea(context, "+90 545 216 35 54"),
          Container(padding:EdgeInsets.only(top: 30),
          child: circularOutlinedButton()),
        ],
      ),
    ));
  }

  Container InfoTextArea(BuildContext context, String InfoText) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      color: Colors.grey[300],
      width: 50,
      child: Text(InfoText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
    );
  }

  OutlinedButton circularOutlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      child: const Icon(
        Icons.call,
        size: 60,
        color: Colors.black,
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
