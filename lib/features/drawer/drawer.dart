import 'package:accompany/features/service_routes/service_routes_view.dart';

import 'package:accompany/features/profile/profile_view.dart';

import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/iconic_icons.dart';

import '../suggestions/suggestions_view.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //Todo Renk tonu tutmadı bunu sonradan rgb olarak ver
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      //! NetworkImage içindeki fotograf test amaclidir sonradan değişecek
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/474x/8f/1b/09/8f1b09269d8df868039a5f9db169a772.jpg"),
                    ),
                    Column(
                      children: const [
                        SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          "Human Resources",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 30,
                thickness: 5,
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Gerekli Sayfaya Yönlendirilecek
                      builder: (context) => ProfileView(),
                    ),
                  );
                },
                leading: const Icon(
                  Iconic.user,
                  color: Colors.black,
                  size: 40,
                ),
                title: const Text(
                  "Profile(Detailed)",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuggestionsView(),
                    ),
                  );
                },
                leading: const Icon(
                  Elusive.lightbulb,
                  color: Colors.black,
                  size: 40,
                ),
                title: const Text(
                  "Suggestions and Compliments",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //!      Gerekli Sayfaya Yönlendirilecek
                  //     builder: (context) => ProfileDetailedPage(),
                  //   ),
                  // );
                },
                leading: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.black,
                  size: 40,
                ),
                title: const Text(
                  "About Company",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceRoutesView(),
                    ),
                  );
                },
                leading: const Icon(
                  Icons.bus_alert_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                title: const Text(
                  "Staff Service Routes",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: const Text('Log Out',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
