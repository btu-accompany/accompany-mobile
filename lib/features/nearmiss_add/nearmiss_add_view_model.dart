import 'dart:io';

import 'package:accompany/features/nearmiss_add/nearmiss_add_view.dart';
import 'package:accompany/models/nearmiss_model.dart';
import 'package:accompany/services/nearmiss_service.dart';
import 'package:accompany/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

abstract class NearMissAddViewModel extends State<NearMissAddView> {
  XFile? image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  String dropdownValue = 'General';
  TextEditingController textAreaController = TextEditingController();
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    nearMissService = NearMissService();
  }

  late final NearMissService nearMissService;

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

  Future<void> sendButtonClicked() async {
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

    final model = NearmissModel(
        img: File(image!.path).toString(),
        title: dropdownValue.toString(),
        description: textAreaController.value.text.toString(),
        senderName:
            "${SharedPrefHelper.prefInstance.getString("name")} ${SharedPrefHelper.prefInstance.getString("surname")}");
    print(model.senderName);
    postNearMiss(model).then((value) {
      notifyUsers(model);
    });
  }

  Future<void> postNearMiss(NearmissModel model) async {
    _toggleLoading();
    await nearMissService.postNearMiss(model, File(image!.path));
    _toggleLoading();
  }

  Future<void> notifyUsers(NearmissModel model) async {
    final result = await nearMissService.notifyUsersAboutNearMiss(model);
    if (result) {
      //islem basarili
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
    } else {
      Fluttertoast.showToast(
        msg: "Failed to create near miss",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
