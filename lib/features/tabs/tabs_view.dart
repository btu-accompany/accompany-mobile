import 'package:accompany/features/contacts/contacts_details_view.dart';
import 'package:accompany/features/contacts/contacts_view.dart';
import 'package:accompany/features/drawer/drawer.dart';
import 'package:accompany/features/foods/foods.dart';
import 'package:accompany/features/home/home_view.dart';
import 'package:accompany/features/nearmiss/nearmiss_add_view.dart';
import 'package:accompany/features/nearmiss/nearmiss_view.dart';
import 'package:accompany/features/notifications/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'tabs_view_model.dart';

class AccompanyTabView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AccompanyTabView({Key? key}) : super(key: key);

  @override
  State<AccompanyTabView> createState() => _AccompanyTabViewState();
}

class _AccompanyTabViewState extends TabViewModel {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: buildBottomAppBar(context),
          appBar: AppBar(
            title: const Text("Accompany"),
          ),
          body: TabBarView(
            children: [
              NearMissView(),
              ContactsView(),
              HomeView(),
              NotificationsView(),
              FoodListView(),
            ],
          ),
          drawer: const Drawer(
              child: SafeArea(
            child: DrawerView(),
          )),
        ));
  }
}

BottomAppBar buildBottomAppBar(BuildContext context) {
  return BottomAppBar(
    color: Colors.white,
    child: TabBar(
      tabs: [
        singleTab(Icons.personal_injury_sharp),
        singleTab(Icons.phone),
        singleTab(Icons.home),
        singleTab(Icons.notifications),
        singleTab(FontAwesome.food),
      ],
    ),
  );
}

Container singleTab(IconData icon) {
  // ignore: sized_box_for_whitespace
  return Container(
    height: 50.0,
    child: Tab(
      icon: Icon(
        icon,
        color: Colors.black,
        size: 35,
      ),
    ),
  );
}
