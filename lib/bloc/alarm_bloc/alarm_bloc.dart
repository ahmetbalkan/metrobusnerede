import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import '../../locator.dart';
import '../../models/bus_stop.dart';
import '../../notification.dart';
import '../../repository/repository.dart';
part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final locationRepository = locator.get<LocationRepository>();
  LocalNotificationService service = LocalNotificationService();
  List<busStop> busStoplist = [];
  var box2 = Hive.box('notif');
  late LocationSettings locationSettings;
  AlarmBloc() : super(AlarmLoading()) {
    service.intialize();
    settings();
    on<LoadAlarmEvent>((event, emit) async {
      busStoplist = await locationRepository.busStopList();
      try {
        StreamSubscription<Position> positionStream =
            Geolocator.getPositionStream(locationSettings: locationSettings)
                .listen((Position position) async {
          for (var i = 0; i < busStoplist.length; i++) {
            if (busStoplist[i].name == event.alarm) {
              double alarmdistance = await calculateDistance(
                  position.latitude,
                  position.longitude,
                  busStoplist[i].latitude,
                  busStoplist[i].longitude);
              if (alarmdistance < (busStoplist[i].check / 2) + 50) {
                bool notif = await box2.get("notif");
                if (notif == true) {
                  if (alarmdistance < busStoplist[i].check) {
                    service.showNotification(
                        id: 3,
                        title: busStoplist[i].name + " Durağına Vardınız. ",
                        body: "Lütfen kapıya doğru ilerleyiniz.");
                  }
                  box2.put("notif", false);
                }
              }
            }
          }
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void settings() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 1),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.automotiveNavigation,
        distanceFilter: 5,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      );
    }
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
