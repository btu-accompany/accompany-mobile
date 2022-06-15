import 'package:accompany/features/contacts/contacts_view.dart';
import 'package:accompany/models/contact_model.dart';
import 'package:accompany/services/contact_service.dart';
import 'package:flutter/material.dart';

abstract class ContactsViewModel extends State<ContactsView> {
  List<ContactModel> matchedContacts = [];

  bool isSearched = false;

  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void checkList(String query) {
    setState(() {
      matchedContacts.clear();
    });
    if (query != "") {
      setState(() {
        isSearched = true;
      });
      for (var contact in contactList!) {
        if ((contact.name!.toLowerCase() + contact.surname!.toLowerCase())
            .contains(query.toLowerCase())) {
          setState(() {
            matchedContacts.add(contact);
          });
        }
      }
    } else {
      setState(() {
        matchedContacts.clear();
        isSearched = false;
      });
    }
  }

  List<ContactModel>? contactList;
  late ContactService _contactsService;
  fetchContacts() async {
    _toggleLoading();
    contactList = await _contactsService.fetchContacts();
    _toggleLoading();
  }

  @override
  void initState() {
    super.initState();
    _contactsService = ContactService();
    fetchContacts();
  }
}
