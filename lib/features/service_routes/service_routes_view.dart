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
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(color: Colors.white),),
          ),
        );
  }

  Container RouteList() {
    return Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.fiber_manual_record,
                      color: Colors.blue,),
                      title: Text("outeList[index].stationName.toString()"),
                    ),
                  ),
                );
              }),
        );
  }
}
