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
                  "https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg"),
              profileDetailCard("Name Surname", "John Doe"),
              profileDetailCard("Departman", "Human Resources"),
              profileDetailCard("Mail Adress", "johndoe@accompany.com"),
              profileDetailCard("Home Adress",
                  "7 Phelan St, Rathvilly, Co. Carlow, R93 FD88"),
              profileDetailCard("Phone Number", "+21 756 76 55"),
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
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 16),
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
            margin: EdgeInsets.only(left: 10),
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
