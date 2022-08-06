import 'dart:ui';
import 'package:flutter/Material.dart';
import '../constant/color.dart';
import '../constant/constant.dart';
import 'leftside/homepage_left.dart';
import 'rightside/homepage_right.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
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
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Icon(
                Icons.menu,
                size: 35,
              ),
              Text(
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
}
