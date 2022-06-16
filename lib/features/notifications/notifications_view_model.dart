import 'package:accompany/services/notifications_service.dart';
import 'package:flutter/material.dart';

import 'notifications_view.dart';

abstract class NotificationsViewModel extends State<NotificationsView> {
  late NotificationsService _notificationsService;

  List<dynamic>? notificationList;

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  fetchNotifications() async {
    _toggleLoading();
    notificationList = await _notificationsService.getNotifications();
    _toggleLoading();
  }

  @override
  void initState() {
    super.initState();
    _notificationsService = new NotificationsService();
    fetchNotifications();
  }
}
