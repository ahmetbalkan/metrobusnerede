import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';

import '../../models/bus_stop.dart';
import '../../repository/repository.dart';

part 'next_stop_event.dart';
part 'next_stop_state.dart';

class NextStopBloc extends Bloc<NextStopEvent, NextStopState> {
  NextStopBloc()
      : super(const NextStopInitial(
            firstValue: "Yükleniyor.", firstnextStopid: 0)) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];
    List<double> distanceList = [];

    on<UpdateNextStopEvent>((event, emit) async {
      var box = Hive.box('firsttime');
      bool? a = await box.get("firsttime");
      int way = event.way;
      busStoplist.clear();
      distanceList.clear();
      busStoplist = await locationRepository.busStopList();

      for (var i = 0; i < busStoplist.length; i++) {
        double distance = await calculateDistance(
          event.position.latitude,
          event.position.longitude,
          busStoplist[i].latitude,
          busStoplist[i].longitude,
        );
        distanceList.add(distance);
      }

      double minDistance = await findMin(distanceList);

      for (var i = 0; i < distanceList.length; i++) {
        if (distanceList[i] == minDistance) {
          if (a == true) {
            if (way == 0) {
              if (busStoplist[i].busstopid == 43) {
                emit(MyNextStopState(
                    nextStopValue: await busStoplist[43].name,
                    nextstopid: busStoplist[43].busstopid));
              } else {}
            }
            if (way == 1) {
              if (busStoplist[i].busstopid == 0) {
                emit(MyNextStopState(
                    nextStopValue: await busStoplist[0].name,
                    nextstopid: busStoplist[0].busstopid));
              } else {
                emit(MyNextStopState(
                    nextStopValue: busStoplist[i - 1].name,
                    nextstopid: busStoplist[i - 1].busstopid));
              }
            }
            await box.put("firsttime", false);
          }

          if (way == 0) {
            if (minDistance < busStoplist[i].check / 2) {
              if (busStoplist[i].busstopid == 43) {
                emit(MyNextStopState(
                    nextStopValue: await busStoplist[43].name,
                    nextstopid: busStoplist[43].busstopid));
              } else {
                emit(MyNextStopState(
                    nextStopValue: await busStoplist[i + 1].name,
                    nextstopid: busStoplist[i].busstopid));
              }
            }
          }
          if (way == 1) {
            if (minDistance < busStoplist[i].check / 2) {
              if (busStoplist[i].busstopid == 0) {
                emit(MyNextStopState(
                    nextStopValue: await busStoplist[0].name,
                    nextstopid: busStoplist[0].busstopid));
              } else {
                emit(MyNextStopState(
                    nextStopValue: busStoplist[i - 1].name,
                    nextstopid: busStoplist[i - 1].busstopid));
              }
            }
          }
        }
      }
    });
  }

  Future<double> calculateDistance(lat1, lon1, lat2, lon2) async {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 1000 * 12742 * asin(sqrt(a));
  }

  Future<double> findMin(List<double> numbers) async {
    return numbers.reduce(min);
  }
}
