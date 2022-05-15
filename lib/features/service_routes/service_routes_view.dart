import 'package:flutter/material.dart';

import 'service_routes_view_model.dart';

class ServiceRoutesView extends StatefulWidget {
  const ServiceRoutesView({Key? key}) : super(key: key);

  @override
  State<ServiceRoutesView> createState() => _ServiceRoutesViewState();
}

class _ServiceRoutesViewState extends ServiceRoutesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Title(context, "Servisler"),
          routes == null
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: routes?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return routeCard(
                        'Noktalar: ${routes?[index].durakAdi ?? ""} -> \nGeçiş Saati ${routes?[index].gecisSaati ?? ""}');
                  },
                ),
        ],
      ),
    );
  }

  Container Title(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }

  Card routeCard(String route) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.fiber_manual_record),
        title: Text(route),
      ),
    );

  }
}
