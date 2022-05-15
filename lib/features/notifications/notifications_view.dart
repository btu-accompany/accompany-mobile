import 'package:accompany/features/notifications/notifications_add_view.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 3),
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddNotification(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 50,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  color: const Color.fromARGB(255, 211, 211, 211),
                  child: SizedBox(
                    height: 125.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/accompany_logo.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                  child: Container(
                                    width: 275,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 190, 190, 190),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 3),
                                      child: Text(
                                        "Sabah 10 da mobile ui tasarımı ile ilgili tasarım toplantısı yapılacak.",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 5, 0, 2),
                                  child: SizedBox(
                                      width: 260,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 190, 190, 190),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 3, 5, 3),
                                              child: Text(
                                                "Kerem Ersu",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 48, 48, 54)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 190, 190, 190),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 3, 5, 3),
                                              child: Text(
                                                "13.30",
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
