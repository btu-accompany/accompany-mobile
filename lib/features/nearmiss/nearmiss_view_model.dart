import 'package:accompany/features/nearmiss/nearmiss_view.dart';
import 'package:accompany/models/nearmiss_model.dart';
import 'package:accompany/services/nearmiss_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class NearMissViewModel extends State<NearMissView> {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  List<NearmissModel>? nearMissList;
  late NearMissService _nearMissService;
  fetchNearMisses() async {
    _toggleLoading();
    nearMissList = await _nearMissService.fetchNearmisses();
    _toggleLoading();
  }

  @override
  void initState() {
    super.initState();
    _nearMissService = NearMissService();
    fetchNearMisses();
  }
}
