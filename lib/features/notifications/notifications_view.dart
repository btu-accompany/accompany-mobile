import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo bildirimlerin üstüne sag yukarı + butonu eklencek
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2,
              color: Color.fromARGB(255, 211, 211, 211),
              child: Container(
                height: 125.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/accompany_logo.png',
                            ),
                          )),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                              child: Container(
                                width: 275,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 190, 190, 190),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 3),
                                  child: Text(
                                    "Sabah 10 da mobile ui tasarımı ile ilgili tasarım toplantısı yapılacak.",
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
                                          padding:
                                              EdgeInsets.fromLTRB(5, 3, 5, 3),
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
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 190, 190, 190),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 3, 5, 3),
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
    );
  }
}
