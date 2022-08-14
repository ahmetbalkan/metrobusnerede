import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:metrobusnerede/locator.dart';
import 'package:vibration/vibration.dart';
import '../../constant/color.dart';
import '../../constant/constant.dart';
import '../leftside/homepage_left.dart';
import '../repository/repository.dart';
import '../rightside/homepage_right.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        FlutterRingtonePlayer.stop();
        Vibration.cancel();
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationRepository = locator.get<LocationRepository>();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Bildirim İzni"),
            content: const Text(
                "Alarm olarak ayarladığınız durakta size haber verebilmemiz için bildirimlere izin vermeniz gerekiyor."),
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
