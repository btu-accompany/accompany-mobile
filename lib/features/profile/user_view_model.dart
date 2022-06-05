import 'package:accompany/features/nearmiss/nearmiss_view.dart';
import 'package:accompany/models/register_user_model.dart';
import 'package:accompany/services/register_service.dart';
import 'package:flutter/material.dart';

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

  List<RegisterUserModel>? nearMissList;
  late RegisterService _nearMissService;
  fetchNearMisses() async {
    _toggleLoading();
    nearMissList = await _nearMissService.fetchUserInfos();
    _toggleLoading();
  }

  @override
  void initState() {
    super.initState();
    _nearMissService = RegisterService();
    fetchNearMisses();
  }
}
