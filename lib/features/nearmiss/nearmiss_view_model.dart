import 'dart:convert';

import 'package:accompany/features/nearmiss/nearmiss_view.dart';
import 'package:accompany/models/near_miss_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class NearMissViewModel extends State<NearMissView> {
  late Future<NearMissesModel> nearMisses;
  List<NearMissModel> nearMissList = [];
  Future<NearMissesModel> fetchNearMisses() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/nearmiss'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      debugPrint(response.body.toString());
      return NearMissesModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void convertFutureListToList() async {
    var object = await nearMisses;
    nearMissList = object.results;
    setState(() {});
  }

  @override
  void initState() {
    nearMisses = fetchNearMisses();
    convertFutureListToList();
    debugPrint(nearMissList.toString());
    super.initState();
  }
}
