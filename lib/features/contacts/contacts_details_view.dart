// ignore_for_file: must_be_immutable

import 'package:accompany/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactsDetails extends StatefulWidget {
  ContactModel? contactModel;

  ContactsDetails({Key? key, this.contactModel}) : super(key: key);

  @override
  State<ContactsDetails> createState() => _ContactsDetails();
}

class _ContactsDetails extends State<ContactsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.contactModel?.name ?? ""}'s Profile"),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network(
                        (widget.contactModel?.ppUrl ?? "").contains("uploads")
                            ? "${"http://10.0.2.2:3000/" + (widget.contactModel?.ppUrl ?? "").replaceAll('\\', '/')}"
                            : widget.contactModel?.ppUrl ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              InfoTextArea(context,
                  "${widget.contactModel?.name ?? ""} ${widget.contactModel?.surname ?? ""}"),
              InfoTextArea(context, widget.contactModel?.departmant ?? ""),
              InfoTextArea(context, widget.contactModel?.email ?? ""),
              InfoTextArea(context, widget.contactModel?.phoneNumber ?? ""),
              InfoTextArea(context, widget.contactModel?.address ?? ""),
              Container(
                  padding: const EdgeInsets.only(top: 30),
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
