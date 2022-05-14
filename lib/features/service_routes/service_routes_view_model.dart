import 'package:accompany/models/service_route_model.dart';
import 'package:accompany/services/bus_routes_service.dart';
import 'package:flutter/material.dart';

import 'service_routes_view.dart';

abstract class ServiceRoutesViewModel extends State<ServiceRoutesView> {
  List<BusRouteModel>? _routes;
  bool _isLoading = false;

  late final IBusRoutesService _busRoutesService;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  List<BusRouteModel>? get routes {
    return _routes;
  }

  bool get isLoading {
    return _isLoading;
  }

  @override
  void initState() {
    super.initState();
    _busRoutesService = BusRoutesService();
    fetchRoutes();
  }

  Future<void> fetchRoutes() async {
    _toggleLoading();
    _routes = await _busRoutesService.fetchRoutes();
    _toggleLoading();
  }
}
