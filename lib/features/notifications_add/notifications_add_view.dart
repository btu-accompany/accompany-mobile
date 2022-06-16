import 'package:accompany/features/tabs/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'notifications_add_view_model.dart';

class AddNotification extends StatefulWidget {
  List<Map<String, String>> selectedUsers;
  AddNotification({Key? key, required this.selectedUsers}) : super(key: key);

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends AddNotificationViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notification"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.selectedUsers.length,
                itemBuilder: ((context, index) {
                  return userCard(
                      widget.selectedUsers[index]["name"].toString(),
                      widget.selectedUsers[index]["surname"].toString(),
                      widget.selectedUsers[index]["departmant"].toString());
                })),
          ),
          Expanded(
            flex: 4,
            child: DetailTextArea(context),
          ),
          Expanded(
            flex: 2,
            child: SendButton(context),
          ),
        ],
      ),
    );
  }

  Card userCard(String name, String surname, String deparmant) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.greenAccent,
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            "$name $surname - $deparmant",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DetailTextArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: TextField(
        controller: descController,
        minLines: 10,
        maxLines: 12,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          fillColor: Color.fromARGB(255, 190, 190, 190),
          filled: true,
          hintText: 'Type what you want to notificate.',
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
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
            sendButtonClicked();
            Fluttertoast.showToast(
              msg:
                  "Your notification will be forwarded to the selected contacts with the message you write.",
              backgroundColor: Colors.red,
              gravity: ToastGravity.CENTER,
              toastLength: Toast.LENGTH_LONG,
            ).then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccompanyTabView(),
                  ),
                  (route) => false);
            });
          },
          child: const Text(
            'Send',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
