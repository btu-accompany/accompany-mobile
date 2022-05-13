import 'dart:convert';
import 'dart:io';

import 'package:accompany/features/nearmiss/nearmiss_add_view.dart';
import 'package:accompany/models/near_miss_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

abstract class NearMissAddViewModel extends State<NearMissAddView> {
  XFile? image;
  File? imageFile;
  String dropdownValue = 'General';
  TextEditingController textAreaController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void showCustomAlertDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Choose Option'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              const Divider(
                height: 1,
                color: Colors.blue,
              ),
              ListTile(
                onTap: () {
                  openGallery(context);
                },
                title: const Text("Gallery"),
                leading: const Icon(
                  Icons.account_box,
                  color: Colors.blue,
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.blue,
              ),
              ListTile(
                onTap: () {
                  openCamera(context);
                },
                title: const Text("Camera"),
                leading: const Icon(
                  Icons.camera,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openGallery(BuildContext context) async {
    final XFile? readedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = File(readedImage!.path);
      image = readedImage;
    });

    Navigator.pop(context);
  }

  void openCamera(BuildContext context) async {
    final XFile? readedImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = File(readedImage!.path);
      image = readedImage;
    });
    Navigator.pop(context);
  }

  void sendButtonClicked() {
    if (imageFile == null) {
      Fluttertoast.showToast(
          msg: "Please select an image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }
    if (textAreaController.value.text == "") {
      Fluttertoast.showToast(
          msg: "Please type your explanation",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return;
    }

    createNearMiss(
        dropdownValue.toString(), textAreaController.value.text.toString());
  }

  Future<void> createNearMiss(String title, String description) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/nearmiss'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var object = NearMissModel.fromJson(jsonDecode(response.body));
      var imageResponse = await patchImage(object.id);
      if (imageResponse.statusCode == 200 || imageResponse.statusCode == 201) {
        notify_users(title, description);
        Fluttertoast.showToast(
          msg: "Near Miss Recorded",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        ).then(
          (value) => Navigator.pop(context),
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Failed to create near miss",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // throw Exception('Failed to create album.');
    }
  }

  Future<http.StreamedResponse> patchImage(String postId) async {
    var request = http.MultipartRequest(
        "PATCH", Uri.parse('http://10.0.2.2:3000/nearmiss'));
    request.fields['_id'] = postId;
    request.files.add(await http.MultipartFile.fromPath("img", image!.path));

    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });

    var result = await request.send();
    return result;
  }

  Future<void> notify_users(String title, String desc) async {
    await http.post(
      Uri.parse('http://10.0.2.2:3000/nearmiss/notify-users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'desc': desc,
      }),
    );
  }
}
