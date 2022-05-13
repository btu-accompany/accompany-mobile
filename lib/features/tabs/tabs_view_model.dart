import 'package:accompany/features/tabs/tabs_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../services/local_notification_service.dart';

abstract class TabViewModel extends State<AccompanyTabView> {
  void getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("TOKEN ALINMALI");
    print(fcmToken);
  }

  @override
  void initState() {
    super.initState();
    getToken();

    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.subscribeToTopic("nearmiss");

    //uygulamayı kapalı halden açar ve mesajı sana verir
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["page"];
        //! DİREKT OLARAK GEREKLİ SAYFAYA YÖNLENDİRME YAPMASI LAZIM
        print(routeFromMessage);
      }
    });

    //Ön Yüzde
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        //todo yazdırmak yerine gerekli sayfaya yönlendirme sağlanacak
        print(message.notification!.title);
        print(message.notification!.body);
      }

      LocalNotificationService.display(message);
    });

    //Uygulama arka planda ama açık, tıklandıgında bizim yolladıgımız veriyle beraber gerekli sayfaya gidicek
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      //Firebase'den bir data yollucaz. bu datanın key'i route olacak
      // value'su ise bizim sayfalarımızın birinin ismi olacak.
      final routeFromMessage = message.data["page"];

      print(routeFromMessage);
    });
  }
}
