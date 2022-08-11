import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:metrobusnerede/locator.dart';
import '../../constant/color.dart';
import '../../constant/constant.dart';
import '../leftside/homepage_left.dart';
import '../repository/repository.dart';
import '../rightside/homepage_right.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationRepository = locator.get<LocationRepository>();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Bildirim İzni"),
            content: const Text("Bildirimlere izin vermeniz gerekmektedir."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("İzin Verme"),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) => Navigator.pop(context)),
                child: const Text("İzin Ver"),
              ),
            ],
          ),
        );
      }
    });

    Future.delayed(
        Duration.zero, () => locationRepository.showWayDialog(context));
    //int _secilenMenu = 0;
    return Scaffold(
      appBar: locationRepository.appbarWidget(locationRepository, context),
      backgroundColor: backgroundColor,
      body: Row(children: [
        Expanded(
            flex: 3,
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: Constant.borderSize,
                  ),
                ),
                child: const HomepageLeft())),
        Expanded(
            flex: 7,
            child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: Constant.borderSize, color: borderColor),
                    right: BorderSide(
                        width: Constant.borderSize, color: borderColor),
                    top: BorderSide(
                        width: Constant.borderSize, color: borderColor),
                  ),
                ),
                child: const HomepageRight())),
      ]),
    );
  }
}
