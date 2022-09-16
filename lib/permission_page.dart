import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
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
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(FontAwesomeIcons.userShield,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("permission".tr,
                                          style: Constant.permPageBigfont,
                                          textAlign: TextAlign.center),
                                      Text("permissiondesc".tr,
                                          style: Constant.permPageSmallfont,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(
                                      FontAwesomeIcons.locationCrosshairs,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("locationperm".tr,
                                          style: Constant.permPageBigfont,
                                          textAlign: TextAlign.center),
                                      Text("locationpermdesc".tr,
                                          style: Constant.permPageSmallfont,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(FontAwesomeIcons.locationArrow,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("backgroundpermission".tr,
                                          style: Constant.permPageBigfont,
                                          textAlign: TextAlign.center),
                                      Text("backgroundpermissiondesc".tr,
                                          style: Constant.permPageSmallfont,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(FontAwesomeIcons.bell,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("notificationpermission".tr,
                                          style: Constant.permPageBigfont,
                                          textAlign: TextAlign.center),
                                      Text("notificationpermissiondesc".tr,
                                          style: Constant.permPageSmallfont,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(FontAwesomeIcons.adversal,
                                      color: Colors.white),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("advertisement".tr,
                                          style: Constant.permPageBigfont,
                                          textAlign: TextAlign.center),
                                      Text("advertisementdesc".tr,
                                          style: Constant.permPageSmallfont,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 10,
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
                                        locationRepository
                                            .permlocAlwaysDialog(context);
                                        PermissionStatus location =
                                            await Permission
                                                .locationAlways.status;
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
                                            PermissionStatus noti =
                                                await Permission.notification
                                                    .request();

                                            print(
                                                "NOTİ PERM " + noti.toString());
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
                                            if (noti ==
                                                PermissionStatus.denied) {
                                              await Future.delayed(
                                                  const Duration(seconds: 1));

                                              if (!mounted) return;
                                              locationRepository
                                                  .permSettingAndroidDialog(
                                                      context);
                                            }
                                          }
                                        }
                                      }

                                      if (location == PermissionStatus.denied) {
                                        locationRepository
                                            .locationPermaDeniedDialog(context);
                                      }

                                      if (location ==
                                          PermissionStatus.permanentlyDenied) {
                                        locationRepository
                                            .locationPermaDeniedDialog(context);
                                      }
                                    },
                                    child: Text("permbuttontext".tr)),
                              ),
                            )
                          ]),
                    ],
                  ),
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
