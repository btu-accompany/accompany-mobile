import 'package:accompany/features/notifications/notifications_add_view.dart';
import 'package:flutter/material.dart';

class ContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                return Card(
                  elevation: 2,
                  color: Color.fromARGB(255, 211, 211, 211),
                  child: Container(
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Container(
                                    width: 380,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 190, 190, 190),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 3),
                                      child: Text(
                                        "Kerem Ersu",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(1, 5, 0, 2),
                                  child: Container(
                                      width: 260,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 190, 190, 190),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 3, 5, 3),
                                              child: Text(
                                                "+90 545 216 35 54",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 48, 48, 54)),
                                              ),
                                            ),
                                          ),
                                          //todo Software dev containeri sağa alınmıyor
                                          Container(
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 190, 190, 190),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 3, 5, 3),
                                              child: Text(
                                                "Software Dev",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 48, 48, 54)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
