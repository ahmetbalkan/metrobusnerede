import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:vibration/vibration.dart';
import '../../locator.dart';
import '../../models/bus_stop.dart';
import '../../notification.dart';
import '../../notifications.dart';
import '../../repository/repository.dart';
part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final locationRepository = locator.get<LocationRepository>();
  final location = locator.get<Location>();
  LocalNotificationService service = LocalNotificationService();
  List<busStop> busStoplist = [];
  var box2 = Hive.box('notif');

  AlarmBloc() : super(AlarmLoading()) {
    service.intialize();
    settings();
    on<LoadAlarmEvent>((event, emit) async {
      busStoplist = await locationRepository.busStopList();
      location.onLocationChanged.listen((location) async {
        for (var i = 0; i < busStoplist.length; i++) {
          if (busStoplist[i].name == event.alarm) {
            double alarmdistance = await calculateDistance(
                location.latitude,
                location.longitude,
                busStoplist[i].latitude,
                busStoplist[i].longitude);
            print("distance " + alarmdistance.toString());
            if (alarmdistance < (busStoplist[i].check / 2) + 50) {
              bool notif = await box2.get("notif");
              if (notif) {
                createAlarmNotification(busStoplist[i].name);
              }
            }
          }
        }
      });
    });
    on<UpdateAlarmEvent>((event, emit) {});
  }

  void settings() async {
    bool a = await location.serviceEnabled();

    if (a == false) {
      location.requestService();
    }
    location.enableBackgroundMode();
    location.changeNotificationOptions(
      channelName: "MetrobusNeredeLocation",
      title: "Metrobüs Nerede?",
      iconName: '@drawable/metrobuslogo',
      color: const Color(0xFFe94546),
      subtitle: "Uygulaması Konumunuza Erişiyor",
      description:
          "Metrobüs Nerede Uygulaması şuan konumunuza erişim sağlıyor.",
    );

    location.changeSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 10, interval: 1000);
  }

  Future<double> calculateDistance(lat1, lon1, lat2, lon2) async {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 1000 * 12742 * asin(sqrt(a));
  }
}
