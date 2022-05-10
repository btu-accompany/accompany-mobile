import 'dart:io';

import 'package:accompany/features/nearmiss/nearmiss_add_view_model.dart';
import 'package:flutter/material.dart';

class NearMissAddView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NearMissAddView({Key? key}) : super(key: key);

  @override
  State<NearMissAddView> createState() => _NearMissAddViewState();
}

class _NearMissAddViewState extends NearMissAddViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
        children: [
          imageFile != null
              ? CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(File(imageFile!.path)),
                )
              : circularOutlinedButton(),
          nearMissTopicsDropDownMenu(context),
          descriptonTextArea(context),
          borderRadiusElevatedButton(context),
        ],
      ),
    ));
  }

  Stack borderRadiusElevatedButton(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.greenAccent),
            ),
            onPressed: () {
              sendButtonClicked();
            },
            child: const Text('Send', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }

  Card descriptonTextArea(BuildContext context) {
    return Card(
        color: Colors.grey[350],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textAreaController,
            maxLines: 10,
            decoration: const InputDecoration.collapsed(
                hintText: "Type your Explanation here."),
          ),
        ));
  }

  OutlinedButton circularOutlinedButton() {
    return OutlinedButton(
      onPressed: () {
        showCustomAlertDialog();
      },
      child: const Text(
        "Click to \nAdd Picture",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(60),
        primary: Colors.black, // <-- Button color
      ),
    );
  }

  Container nearMissTopicsDropDownMenu(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      color: Colors.grey[350],
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'General',
          'Wet Floor',
          'Defective Equipment',
          'Risk of Fire',
          'Poor Lighting'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
