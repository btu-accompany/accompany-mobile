import 'package:accompany/features/notifications/notifications_add_view.dart';
import 'package:flutter/material.dart';

import 'contacts_details_view.dart';

class ContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return ContactsCard(context, "Kerem Ersu",
                      "+90 545 216 35 63", "Software Dep");
                }),
          ],
        ),
      ),
    );
  }

  GestureDetector ContactsCard(BuildContext context, String personName,
      String personNumber, String personDepartment) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactsDetails()));
      },
      child: Card(
        elevation: 2,
        color: Color.fromARGB(255, 211, 211, 211),
        child: SizedBox(
          child: Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 190, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      personName,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 190, 190, 190),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          // padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            personNumber,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 48, 48, 54)),
                          ),
                        ),
                      ),
                      //todo Software dev containeri sağa alınmıyor
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 190, 190, 190),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            personDepartment,
                            style: TextStyle(
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
