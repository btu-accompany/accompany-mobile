import 'package:accompany/features/profile/profile_edit_view.dart';
import 'package:accompany/services/shared_service.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String imgUri = "http://10.0.2.2:3000/" +
      SharedPrefHelper.prefInstance
          .getString("ppUrl")
          .toString()
          .replaceAll('\\', '/');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile Detailed"),
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileEditView(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ),
            CircularProfilePhoto(context, imgUri),
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
    );
  }

  CircleAvatar CircularProfilePhoto(BuildContext context, String ppUrl) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60,
      child: ClipOval(
        child: Image.network(
          ppUrl,
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
