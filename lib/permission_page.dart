import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metrobusnerede/Homepage/home_page_widget.dart';
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
  PermissionStatus? locationperm, notificationperm;
  final locationRepository = locator.get<LocationRepository>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Platform.isAndroid == true
              ? Column(
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
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 20, right: 20),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Image.asset(
                                  "assets/herzaman.png",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
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

                                      if (location ==
                                          PermissionStatus.granted) {
                                        PermissionStatus location =
                                            await Permission.locationAlways
                                                .request();
                                        print(location);
                                        if (location ==
                                            PermissionStatus.granted) {
                                          PermissionStatus noti =
                                              await Permission.notification
                                                  .request();
                                          if (noti ==
                                              PermissionStatus.granted) {
                                            await Future.delayed(
                                                const Duration(seconds: 1));

                                            if (!mounted) return;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MyHomePage()));
                                          }
                                          if (noti == PermissionStatus.denied) {
                                            await Future.delayed(
                                                const Duration(seconds: 1));

                                            if (!mounted) return;
                                            locationRepository
                                                .permSettingAndroidDialog(
                                                    context);
                                          }
                                        }
                                        if (location ==
                                            PermissionStatus.denied) {}
                                        if (location ==
                                            PermissionStatus
                                                .permanentlyDenied) {
                                          locationRepository
                                              .permSettingAndroidDialog(
                                                  context);
                                          if (location ==
                                              PermissionStatus.granted) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MyHomePage()));
                                          }
                                        }
                                      }

                                      if (location ==
                                          PermissionStatus.denied) {}

                                      if (location ==
                                          PermissionStatus.permanentlyDenied) {
                                        locationRepository
                                            .permSettingAndroidDialog(context);
                                      }
                                    },
                                    child: Text("İzin ver / Anasayfaya git")),
                              ),
                            )
                          ]),
                    ),
                  ],
                )
              : Platform.isIOS == true
                  ? Column(children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 20, right: 20, top: 20),
                            child: Text("İzin Sayfası",
                                style: Constant.busStopTitleStyle,
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/first1.png",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    "assets/first2.png",
                                  ),
                                ],
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Text(
                                  "Uygulamanın sağlıklı çalışabilmesi için lokasyon iznini vermeniz gerekmektedir.",
                                  style: Constant.busStopTitleStyle,
                                  textAlign: TextAlign.center),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      requestMultiplePermissions();
                                    },
                                    child: Text("İzin ver / Anasayfaya git")),
                              ),
                            )
                          ]),
                    ])
                  : null),
    );
  }

  void requestMultiplePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.locationAlways,
      Permission.notification,
    ].request();

    if (statuses[Permission.location] == PermissionStatus.granted) {
      if (statuses[Permission.locationAlways] == PermissionStatus.granted) {
        if (statuses[Permission.notification] == PermissionStatus.granted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        } else {
          /*noti else*/
          print('/*noti else*/');
          locationRepository.permSettingIOSDialog(context);
        }
      } else {
        /*location always else*/
        print('/*location alwaays else*/');
        locationRepository.LocationAlwaysDialog(context);
      }
    } else {
      /*location else*/
      print('/*location else*/');
      locationRepository.LocationAlwaysDialog(context);
    }

    print("location permission: ${statuses[Permission.location]}, "
        "noti permission: ${statuses[Permission.notification]}"
        "locationalways permission: ${statuses[Permission.locationAlways]}, ");
  }
}
