import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metrobusnerede/constant/color.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constant/constant.dart';
import '../cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import '../models/bus_stop.dart';

class LocationRepository {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<List<busStop>> busStopList() async {
    List<busStop> busStopList = [];
    busStopList.add(busStop(0, "B.DUZU SONDURAK", 41.022019, 28.625050, 168));
    busStopList.add(busStop(1, "BEYKENT", 41.019562, 28.630895, 154));
    busStopList.add(busStop(2, "CUMHURIYET MAH.", 41.015418, 28.641604, 158));
    busStopList.add(busStop(3, "BEYLIKDUZU BEL.", 41.012331, 28.649756, 243));
    busStopList.add(busStop(4, "BEYLIKDUZU", 41.009682, 28.656780, 157));
    busStopList.add(busStop(5, "GUZELYURT", 41.006587, 28.665286, 144));
    busStopList.add(busStop(6, "HAREMIDERE", 41.005986, 28.673169, 140));
    busStopList.add(busStop(7, "HAREMIDERE SANAYI", 41.004454, 28.684950, 170));
    busStopList.add(busStop(8, "SAADETDERE MAH.", 40.999741, 28.693115, 194));
    busStopList
        .add(busStop(9, "MUSTAFA KEMAL PASA", 40.994989, 28.706205, 184));
    busStopList
        .add(busStop(10, "CIHANGIR UNV. MAH.", 40.990726, 28.713612, 120));
    busStopList.add(busStop(11, "AVCILAR", 40.983564, 28.725990, 180));
    busStopList.add(busStop(12, "ŞUKRUBEY", 40.979978, 28.732035, 190));
    busStopList
        .add(busStop(13, "IBB SOSYAL TESISLER", 40.977975, 28.745077, 142));
    busStopList.add(busStop(14, "KUCUKCEKMECE", 40.986446, 28.769875, 125));
    busStopList.add(busStop(15, "CENNET MAH.", 40.985348, 28.782700, 160));
    busStopList.add(busStop(16, "FLORYA", 40.986746, 28.788792, 387));
    busStopList.add(busStop(17, "BESYOL", 40.994289, 28.794891, 154));
    busStopList.add(busStop(18, "SEFAKOY", 40.998590, 28.798545, 190));
    busStopList.add(busStop(19, "YENIBOSNA", 40.992332, 28.834983, 256));
    busStopList.add(busStop(20, "SIRINEVLER", 40.991722, 28.845987, 221));
    busStopList.add(busStop(21, "BAHCELIEVLER", 40.995098, 28.863594, 132));
    busStopList
        .add(busStop(22, "INCIRLI (BAKIRKOY)", 40.997814, 28.872305, 150));
    busStopList.add(busStop(23, "ZEYTINBURNU", 41.003177, 28.890433, 220));
    busStopList.add(busStop(24, "MERTER", 41.007745, 28.897581, 150));
    busStopList.add(busStop(25, "CEVIZLIBAG", 41.016617, 28.911238, 332));
    busStopList.add(busStop(26, "TOPKAPI", 41.020396, 28.917438, 150));
    busStopList.add(busStop(27, "BAYRAMPASA", 41.024167, 28.921690, 217));
    busStopList.add(busStop(28, "EDIRNEKAPI", 41.033703, 28.930116, 324));
    busStopList
        .add(busStop(29, "AYVANSARAY / EYUP", 41.038698, 28.937556, 260));
    busStopList.add(busStop(30, "HALICIOGLU", 41.048870, 28.946450, 250));
    busStopList.add(busStop(31, "OKMEYDANI", 41.056287, 28.960850, 300));
    busStopList.add(busStop(32, "DARULACEZE PERPA", 41.062485, 28.967853, 250));
    busStopList
        .add(busStop(33, "OKMEYDANI HASTANE", 41.067379, 28.975725, 200));
    busStopList.add(busStop(34, "CAGLAYAN", 41.067337, 28.980851, 180));
    busStopList.add(busStop(35, "MECIDIYEKOY", 41.066869, 28.991690, 230));
    busStopList.add(busStop(36, "ZINCIRLIKUYU", 41.066149, 29.013119, 156));
    busStopList
        .add(busStop(37, "15 TEM. SEH. KOP.", 41.036593, 29.043351, 200));
    busStopList.add(busStop(37, "BURHANIYE", 41.032020, 29.046939, 105));
    busStopList.add(busStop(38, "ALTUNIZADE", 41.021904, 29.048345, 300));
    busStopList.add(busStop(39, "ACIBADEM", 41.014534, 29.057279, 230));
    busStopList.add(busStop(40, "UZUNCAYIR", 40.998859, 29.056540, 162));
    busStopList.add(busStop(41, "FIKIRTEPE", 40.993912, 29.048362, 300));
    busStopList.add(busStop(42, "S.CESME SONDURAK", 40.991768, 29.037694, 130));
    return busStopList;
  }

  void showWayDialog(BuildContext context) {
    var box = Hive.box('firsttime');
    showDialog(
      barrierColor: Colors.black54,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Expanded(
          child: Dialog(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: backgroundColor,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 5,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<WayCounterBlocCubit>().beylikduzu();
                          box.put("firsttime", true);
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 140,
                          height: 150,
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: const Icon(
                                Icons.chevron_left_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Beylikdüzü Avcılar",
                              style: Constant.wayDialogBlackStyle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Yönüne Git",
                                style: Constant.wayDialogRedStyle),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<WayCounterBlocCubit>().sogutluCesme();
                          box.put("firsttime", true);
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 140,
                          height: 150,
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade300,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Zincirlikuyu Söğütlüçeşme",
                              style: Constant.wayDialogBlackStyle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Yönüne Git",
                                style: Constant.wayDialogRedStyle),
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
                    ],
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
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              )),
        );
      },
    );
  }

  void locationDisableDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black54,
      context: context,
      builder: (context) {
        return Expanded(
          child: Dialog(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: backgroundColor,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Bildirim izinleri olmadan alarm sistemi düzgün çalışmaz ve uygulama inmek istediğiniz durakta sizi uyaramaz.",
                    style: Constant.busStopTitleStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Aşağıdaki yönergelere göre izin işlemini gerçekleştirebilirsiniz.",
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
                  Image.asset("assets/noti.png"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            AppSettings.openNotificationSettings();
                          },
                          child: Text("Ayarları Aç")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Kapat")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              )),
        );
      },
    );
  }

  void permSettingDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black54,
      context: context,
      builder: (context) {
        return Expanded(
          child: Dialog(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: backgroundColor,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Bildirim izinleri olmadan alarm sistemi düzgün çalışmaz ve uygulama inmek istediğiniz durakta sizi uyaramaz.",
                    style: Constant.busStopTitleStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Aşağıdaki yönergelere göre izin işlemini gerçekleştirebilirsiniz.",
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
                  Image.asset("assets/noti.png"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            AppSettings.openNotificationSettings();
                          },
                          child: Text("Ayarları Aç")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Kapat")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              )),
        );
      },
    );
  }

  AppBar appbarWidget(
      LocationRepository locationRepository, BuildContext context) {
    return AppBar(
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
                  color: Colors.white,
                ),
                Text(
                  "Yönü Değiştir",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
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
    );
  }

  AppBar appbarAlarmWidget(
      LocationRepository locationRepository, BuildContext context) {
    return AppBar(
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
    );
  }

  Future<String> listTobusStopName(int id) async {
    var list = await busStopList();
    var name = "";
    for (var i = 0; i < list.length; i++) {
      if (list[i].busstopid == id) {
        name = list[i].name;
      }
    }
    return name;
  }

  int idGenerator() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch;
  }

  Future<bool> permCheck() async {
    var a = await Permission.location.status;
    var b = await Permission.locationAlways.status;
    var c = await Permission.notification.status;
    if (a == PermissionStatus.granted &&
        b == PermissionStatus.granted &&
        c == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
