import 'package:accompany/services/shared_service.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile Detailed"),
        ),
        body: Container(
          child: ListView(
            children: [
              CircularProfilePhoto(context,
                  SharedPrefHelper.prefInstance.getString("ppUrl") ?? ""),
              profileDetailCard("Name Surname",
                  "${SharedPrefHelper.prefInstance.getString("name") ?? ""} ${SharedPrefHelper.prefInstance.getString("surname") ?? ""}"),
              profileDetailCard("Departman",
                  SharedPrefHelper.prefInstance.getString("departman") ?? ""),
              profileDetailCard("Mail Adress",
                  SharedPrefHelper.prefInstance.getString("mail") ?? ""),
              profileDetailCard("Home Adress",
                  SharedPrefHelper.prefInstance.getString("address") ?? ""),
              profileDetailCard("Phone Number",
                  SharedPrefHelper.prefInstance.getString("phoneNumber") ?? ""),
            ],
          ),
        ),
      ),
    );
  }

  Container CircularProfilePhoto(BuildContext context, String ppUrl) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: CircleAvatar(
        radius: 50.0,
        child: ClipOval(
          //! NetworkImage içindeki fotograf test amaclidir sonradan değişecek
          child: Image.network(ppUrl),
        ),
      ),
    );
  }

  Container profileDetailCard(String label, String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(text),
            ),
          )
        ],
      ),
    );
  }
}
