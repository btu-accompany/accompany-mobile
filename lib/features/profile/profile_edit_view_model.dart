import 'dart:io';

import 'package:accompany/features/profile/profile_edit_view.dart';
import 'package:accompany/features/tabs/tabs_view.dart';
import 'package:accompany/models/contact_model.dart';
import 'package:accompany/services/contact_service.dart';
import 'package:accompany/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileEditViewModel extends State<ProfileEditView> {
  XFile? image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController deparmantController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  late final ContactService _contactService;

  updateUser(ContactModel contactModel) async {
    // String imagePath = "";
    // if (image == null) {
    //   print("burdayız");
    //   print(contactModel.ppUrl!);
    //   imagePath = contactModel.ppUrl!;
    // } else {
    //   print("elseteyiz");
    //   print(image!.path);
    //   imagePath = image!.path;
    // }
    ContactModel? updatedUser =
        await _contactService.updateContact(contactModel, File(image!.path));

    if (updatedUser != null) {
      await SharedPrefHelper.prefInstance
          .setString("name", updatedUser.name ?? "");
      await SharedPrefHelper.prefInstance
          .setString("departman", updatedUser.departmant ?? "");
      await SharedPrefHelper.prefInstance
          .setString("mail", updatedUser.email ?? "");
      await SharedPrefHelper.prefInstance
          .setString("address", updatedUser.address ?? "");
      await SharedPrefHelper.prefInstance
          .setString("phoneNumber", updatedUser.phoneNumber ?? "");
      await SharedPrefHelper.prefInstance
          .setString("ppUrl", updatedUser.ppUrl ?? "");
    }
  }

  @override
  void initState() {
    super.initState();
    _contactService = ContactService();
  }

  void sendButtonClicked() {
    ContactModel contactModel = ContactModel(
        name: nameController.value.text.isNotEmpty
            ? nameController.value.text
            : SharedPrefHelper.prefInstance.getString("name"),
        departmant: deparmantController.value.text.isNotEmpty
            ? deparmantController.value.text
            : SharedPrefHelper.prefInstance.getString("departman"),
        email: mailController.value.text.isNotEmpty
            ? mailController.value.text
            : SharedPrefHelper.prefInstance.getString("mail"),
        address: addressController.value.text.isNotEmpty
            ? addressController.value.text
            : SharedPrefHelper.prefInstance.getString("address"),
        phoneNumber: phoneNumberController.value.text.isNotEmpty
            ? phoneNumberController.value.text
            : SharedPrefHelper.prefInstance.getString("phoneNumber"),
        ppUrl: imageFile != null
            ? File(image!.path).toString()
            : SharedPrefHelper.prefInstance.getString("ppUrl"));

    print("AAAAAAAAAAAAA");
    print(File(image!.path).toString());
    updateUser(contactModel);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AccompanyTabView(),
        ),
        (route) => false);
  }

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
}
