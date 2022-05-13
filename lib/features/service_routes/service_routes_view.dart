import 'package:flutter/material.dart';

class ServiceRoutesView extends StatefulWidget {
  ServiceRoutesView({Key? key}) : super(key: key);

  @override
  State<ServiceRoutesView> createState() => _ServiceRoutesViewState();
}

class _ServiceRoutesViewState extends State<ServiceRoutesView> {
  List<String> _animals = ["cat", "dog", "elephant", "bird"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Title(context, "Güzergah"),
          RouteList(),
          Title(context, "Saatler"),
          RouteList()
        ],
      ),
    );
  }

  Container Title(BuildContext context, String title) {
    return Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 190, 190, 190),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(title),
          ),
        );
  }

  Container RouteList() {
    return Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: _animals.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.fiber_manual_record),
                      title: Text('Nilüfer Metro'),
                    ),
                  ),
                );
              }),
        );
  }
}
