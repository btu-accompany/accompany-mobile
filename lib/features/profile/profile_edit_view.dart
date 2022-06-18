import 'dart:io';

import 'package:accompany/features/profile/profile_edit_view_model.dart';
import 'package:flutter/material.dart';

import '../../services/shared_service.dart';

class ProfileEditView extends StatefulWidget {
  ProfileEditView({Key? key}) : super(key: key);

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends ProfileEditViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
        ),
        body: ListView(
          children: [
            imageFile != null
                ? Container(
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(File(imageFile!.path)),
                      ),
                    ),
                  )
                : circularOutlinedButton(),
            profileDetailCard(
                "Name",
                "${SharedPrefHelper.prefInstance.getString("name") ?? ""} ${SharedPrefHelper.prefInstance.getString("surname") ?? ""}",
                nameController),
            profileDetailCard(
                "Departman",
                SharedPrefHelper.prefInstance.getString("departman") ?? "",
                deparmantController),
            profileDetailCard(
                "Mail",
                SharedPrefHelper.prefInstance.getString("mail") ?? "",
                mailController),
            profileDetailCard(
                "Adress",
                SharedPrefHelper.prefInstance.getString("address") ?? "",
                addressController),
            profileDetailCard(
                "Phone Number",
                SharedPrefHelper.prefInstance.getString("phoneNumber") ?? "",
                phoneNumberController),
            SendButton(context),
          ],
        ),
      ),
    );
  }

  Widget SendButton(BuildContext context) {
    final ButtonStyle style = OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15));

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: OutlinedButton(
          style: style,
          onPressed: () {
            // sendButtonClicked();
            sendButtonClicked();
          },
          child: const Text(
            'Send',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  OutlinedButton circularOutlinedButton() {
    return OutlinedButton(
      onPressed: () {
        showCustomAlertDialog();
      },
      child: const Text(
        "Click to Change\n Profile Photo",
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

  Container profileDetailCard(
      String label, String text, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Current $label: $text",
              ),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
