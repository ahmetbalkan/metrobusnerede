import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import '../../locator.dart';
import '../../models/bus_stop.dart';
import '../../notification.dart';
import '../../repository/repository.dart';
part 'distance_alarm_stop_event.dart';
part 'distance_alarm_stop_state.dart';

class DistanceAlarmStopBloc
    extends Bloc<DistanceAlarmStopEvent, DistanceAlarmStopState> {
  DistanceAlarmStopBloc()
      : super(const DistanceAlarmStopInitial(
            firstValue: 0, firstbusStopCount: 0)) {
    final locationRepository = locator.get<LocationRepository>();
    final notification = locator.get<LocalNotificationService>();

    var box2 = Hive.box('notif');
    List<busStop> busStoplist = [];

    on<UpdateDistanceAlarmStopEvent>((event, emit) async {
      busStoplist = await locationRepository.busStopList();
      for (var i = 0; i < busStoplist.length; i++) {
        if (busStoplist[i].name == event.alarmStopName) {
          double alarmdistance = await calculateDistance(
              event.position.latitude,
              event.position.longitude,
              busStoplist[i].latitude,
              busStoplist[i].longitude);

          emit(MyDistanceAlarmStopState(
              distanceValue: alarmdistance.toInt(),
              firstbusStopCount: busStoplist[i].busstopid));
        }
      }
    });
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
