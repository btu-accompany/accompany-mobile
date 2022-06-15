import 'package:accompany/features/contacts/contacts_view_model.dart';
import 'package:accompany/models/contact_model.dart';
import 'package:flutter/material.dart';

import 'contacts_details_view.dart';

class ContactsView extends StatefulWidget {
  ContactsView({Key? key}) : super(key: key);

  @override
  State<ContactsView> createState() => _ContactsView();
}

class _ContactsView extends ContactsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  checkList(value);
                },
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            contactList == null
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: isSearched
                        ? matchedContacts.length
                        : contactList?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ContactsCard(
                          context,
                          isSearched
                              ? matchedContacts[index]
                              : contactList?[index]);
                    }),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  GestureDetector ContactsCard(
      BuildContext context, ContactModel? contactModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ContactsDetails(contactModel: contactModel)));
      },
      child: Card(
        elevation: 2,
        color: const Color.fromARGB(255, 211, 211, 211),
        child: SizedBox(
          child: Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 190, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${contactModel?.name ?? ""} ${contactModel?.surname ?? ""}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 190, 190, 190),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            contactModel?.phoneNumber ?? "",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 48, 48, 54)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 190, 190, 190),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            contactModel?.departmant ?? "",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 48, 48, 54)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
