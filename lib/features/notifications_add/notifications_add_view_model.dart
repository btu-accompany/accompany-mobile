// ignore_for_file: avoid_print

import 'package:accompany/features/notifications_add/notifications_add_view.dart';
import 'package:accompany/services/notifications_service.dart';
import 'package:flutter/material.dart';

abstract class AddNotificationViewModel extends State<AddNotification> {
  final TextEditingController descController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  late final NotificationsService _notificationsService;

  @override
  void initState() {
    super.initState();
    _notificationsService = NotificationsService();
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  sendButtonClicked() {
    List<String> receivers = [];
    for (var element in widget.selectedUsers) {
      receivers.add(element["token"]!);
    }
    postNearMiss("Shared", descController.value.text, receivers);
  }

  Future<void> postNearMiss(
      String senderName, String description, List<String> receivers) async {
    _toggleLoading();
    await _notificationsService.postNotifications(
        senderName, description, receivers);
    _toggleLoading();
  }
}
