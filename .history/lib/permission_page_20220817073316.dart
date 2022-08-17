import 'package:flutter/material.dart';
import 'package:metrobusnerede/Homepage/home_page_widget.dart';
import 'package:metrobusnerede/constant/color.dart';
import 'package:metrobusnerede/repository/repository.dart';
import 'package:permission_handler/permission_handler.dart';

import 'constant/constant.dart';
import 'locator.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  final locationRepository = locator.get<LocationRepository>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    child: Text("İzin Sayfası",
                        style: Constant.busStopTitleStyle,
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Image.asset(
                          "assets/herzaman.png",
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Text(
                          "Uygulamanın sağlıklı çalışabilmesi için lokasyon iznini vermeniz gerekmektedir.",
                          style: Constant.busStopTitleStyle,
                          textAlign: TextAlign.center),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              PermissionStatus location =
                                  await Permission.location.request();

                              if (location == PermissionStatus.granted) {
                                PermissionStatus location =
                                    await Permission.locationAlways.request();
                                if (location == PermissionStatus.granted) {
                                  PermissionStatus noti =
                                      await Permission.notification.request();
                                  if (noti == PermissionStatus.granted) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  }
                                }
                                if (location == PermissionStatus.denied) {}
                                if (location ==
                                    PermissionStatus.permanentlyDenied) {
                                  locationRepository.permSettingDialog(context);
                                  if (location == PermissionStatus.granted) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyHomePage()));
                                  }
                                }
                              }

                              if (location == PermissionStatus.denied) {}

                              if (location ==
                                  PermissionStatus.permanentlyDenied) {
                                locationRepository.permSettingDialog(context);
                              }
                            },
                            child: Text("İzin ver / Anasayfaya git")),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
