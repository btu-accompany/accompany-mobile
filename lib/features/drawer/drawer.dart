import 'package:accompany/features/about_company/about_company.dart';
import 'package:accompany/features/login/login.dart';
import 'package:accompany/features/service_routes/service_routes_view.dart';

import 'package:accompany/features/profile/profile_view.dart';
import 'package:accompany/services/shared_service.dart';

import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 50.0,
                        //! NetworkImage içindeki fotograf test amaclidir sonradan değişecek
                        backgroundImage: NetworkImage(
                            SharedPrefHelper.prefInstance.getString("ppUrl") ??
                                ""),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 18.0,
                            ),
                            Text(
                              SharedPrefHelper.prefInstance.getString("name") ??
                                  "",
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 18.0,
                            ),
                            Text(
                              SharedPrefHelper.prefInstance
                                      .getString("surname") ??
                                  "",
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 18.0,
                            ),
                            Text(
                              SharedPrefHelper.prefInstance
                                      .getString("departman") ??
                                  "",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AbooutCompany(),
                    ),
                  );
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
                      builder: (context) => const ServiceRoutesView(),
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
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove("token");
                    setState(() {});
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ),
                        (route) => false);
                  },
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
