import 'dart:io';

import 'package:dio/dio.dart';

import '../models/service_route_model.dart';

abstract class IBusRoutesService {
  Future<List<BusRouteModel>?> fetchRoutes();
}

class BusRoutesService implements IBusRoutesService {
  final String _busRoutesUrl =
      "https://accompany-bus-routes-api.herokuapp.com/";
  final Dio _networkManager;
  BusRoutesService() : _networkManager = Dio();

  @override
  Future<List<BusRouteModel>?> fetchRoutes() async {
    try {
      final response = await _networkManager.get(_busRoutesUrl);

      if (response.statusCode == HttpStatus.ok) {
        var _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => BusRouteModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
