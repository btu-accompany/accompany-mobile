import 'package:accompany/features/nearmiss/nearmiss_view.dart';
import 'package:accompany/models/nearmiss_model.dart';
import 'package:accompany/services/nearmiss_service.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

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

  Socket socket = io("http://10.0.2.2:3000/", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
  });

  void connectToServer() {
    socket.connect(); //connect the Socket.IO Client to the Server

    //SOCKET EVENTS
    // --> listening for connection
    socket.on('connect', (data) {
      print("Connected");
      print(socket.id.toString());
    });

    socket.on('added-nearmiss', (data) => fetchNearMisses());
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
    connectToServer();
    fetchNearMisses();
  }
}
