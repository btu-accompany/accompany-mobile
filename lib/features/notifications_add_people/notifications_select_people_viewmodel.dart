import 'package:accompany/features/notifications_add_people/notifications_select_people_view.dart';
import 'package:flutter/material.dart';

import '../../models/contact_model.dart';
import '../../services/contact_service.dart';

abstract class NotificationsAddPeopleViewModel
    extends State<NotificationsAddPeople> {
  List<ContactModel>? contactList;

  late ContactService _contactsService;

  List<Map<String, String>> selectedItems = [];

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  fetchContacts() async {
    _toggleLoading();
    contactList = await _contactsService.fetchContacts();
    _toggleLoading();
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  bool checkContains(String? id) {
    for (var element in selectedItems) {
      if (element["id"] == id.toString()) {
        return true;
      }
    }
    return false;
  }

  removeSelected(String? id) {
    bool result = checkContains(id);
    if (result) {
      setState(() {
        selectedItems.removeWhere((val) => val["id"] == id);
      });
    }
  }

  addSelected(String? id, String? token, String? name, String? surname,
      String? departmant) {
    bool result = checkContains(id);
    if (result == false) {
      if (id != null &&
          token != null &&
          name != null &&
          surname != null &&
          departmant != null) {
        setState(() {
          selectedItems.add({
            "id": id,
            "token": token,
            "name": name,
            "surname": surname,
            "departmant": departmant
          });
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _contactsService = ContactService();
    fetchContacts();
  }
}
