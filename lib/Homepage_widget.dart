import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/color.dart';
import '../constant/constant.dart';
import 'cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import 'leftside/homepage_left.dart';
import 'rightside/homepage_right.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showWayDialog(context));
    //int _secilenMenu = 0;
    return Scaffold(
      bottomNavigationBar: Theme(
          data: ThemeData(
              primarySwatch: materialColorWhite, canvasColor: backgroundColor),
          //alt kısımda bulunan bottom navigation bölümü seçilen sayfayı _secilenmenu içerisine atıyor oradan Navigation edilebilir.
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.change_circle),
                  label: "asd",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.content_cut),
                  label: "",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "",
                  backgroundColor: Colors.white)
            ],
            type: BottomNavigationBarType.fixed,
            onTap: (index) {},
          )),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 5),
            child: InkWell(
              onTap: () {
                showWayDialog(context);
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.change_circle,
                    size: 35,
                  ),
                  Text(
                    "Yönü Değiştir",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              const Icon(
                Icons.menu,
                size: 35,
              ),
              const Text(
                "Menü",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        title: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/logo.png",
                width: 150,
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
      ),
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
                child: HomepageRight())),
      ]),
    );
  }

  void showWayDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black87,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: backgroundColor,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  textAlign: TextAlign.center,
                  "Lütfen gitmek istediğiniz yönü seçiniz.",
                  style: Constant.busStopTitleStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<WayCounterBlocCubit>().Beylikduzu();
                        print(context.read<WayCounterBlocCubit>().state.way);
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: 300,
                        height: 150,
                        child: Column(children: [
                          Icon(
                            Icons.u_turn_left_sharp,
                            color: backgroundColor,
                            size: 80,
                          ),
                          Text(
                            "Beylikdüzü Avcılar",
                            style: Constant.WayDialogBlackStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Yönüne Git", style: Constant.WayDialogRedStyle),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<WayCounterBlocCubit>().SogutluCesme();
                        print(context.read<WayCounterBlocCubit>().state.way);
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: 300,
                        height: 150,
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.u_turn_right_sharp,
                                color: backgroundColor,
                                size: 70,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Zincirlikuyu Söğütlüçeşme",
                            style: Constant.WayDialogBlackStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Yönüne Git", style: Constant.WayDialogRedStyle),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Seçim yapmadan bu bölümü geçemessiniz.",
                      style: Constant.busStopTitleStyle,
                    ),
                  ],
                )
              ]),
            ));
      },
    );
  }
}
