import 'package:accompany/features/notifications/notifications_add_view.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
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
                    builder: (context) => AddNotification(),
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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey[300],
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: _CircularProfilePhoto(),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                _textContainer(
                                    "Sabah 10 da mobile ui tasarımı ile ilgili tasarım toplantısı yapılacak."),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.all(8),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    runSpacing: 5,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    children: [
                                      _textContainer("Kerem Ersu"),
                                      _textContainer("09:00"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container _textContainer(String text) {
    return Container(
      color: Colors.grey[400],
      padding: const EdgeInsets.all(8),
      child: Text(text),
    );
  }

  CircleAvatar _CircularProfilePhoto() {
    return const CircleAvatar(
      radius: 50.0,
      child: ClipOval(
        //! NetworkImage içindeki fotograf test amaclidir sonradan değişecek
        child: Image(
            image: AssetImage(
          'assets/accompany_logo.png',
        )),
      ),
    );
  }
}
