import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:metrobusnerede/location.dart';
import '../../locator.dart';
import '../../models/busStop.dart';
import '../../repository/repository.dart';
part 'livelocation_event.dart';
part 'livelocation_state.dart';

class LivelocationBloc extends Bloc<LivelocationEvent, LivelocationState> {
  final locationRepository = LocationRepository();
  List<busStop> busStoplist = [];
  List<double> distanceList = [];
  LivelocationBloc() : super(LivelocationLoading()) {
    on<LeftBusStopEvent>((event, emit) async {
      Location.instance.requestPermission();
      bool a = await Location.instance.serviceEnabled();

      if (a == false) {
        Location.instance.requestService();
      }
      Location.instance.enableBackgroundMode();
      Location.instance.changeNotificationOptions(
          channelName: "metrobus",
          description:
              "Metrobüs Nerede Uygulaması şuan konumunuza erişim sağlıyor.",
          title: "Metrobüs Nerede?");
      Location.instance.changeSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 10, interval: 100);
      Location.instance.onLocationChanged.listen((event) async {
        busStoplist = await locationRepository.BusStopList();

        for (var i = 0; i < busStoplist.length; i++) {
          double distance = calculateDistance(event.latitude, event.longitude,
              busStoplist[i].latitude, busStoplist[i].longitude);
          distanceList.add(distance);
          distanceList.sort();
        }

        double minDistance = distanceList[0];
        print(minDistance);
        for (int i = 0; i < busStoplist.length; i++) {
          if (calculateDistance(busStoplist[i].latitude,
                  busStoplist[i].longitude, event.latitude, event.longitude) ==
              minDistance) {
          } else {}
        }

        add(UpdateLeftBusStopEvent(position: event));
      });
    });
    on<UpdateLeftBusStopEvent>((event, emit) {
      emit(LivelocationLoaded(position: event.position.latitude.toString()));
    });

    on<LoadSpeedEvent>((event, emit) async {
      Location.instance.requestPermission();
      bool a = await Location.instance.serviceEnabled();

      if (a == false) {
        Location.instance.requestService();
      }
      Location.instance.enableBackgroundMode();
      Location.instance.changeNotificationOptions(
          channelName: "metrobus",
          description:
              "Metrobüs Nerede Uygulaması şuan konumunuza erişim sağlıyor.",
          title: "Metrobüs Nerede?");
      Location.instance.changeSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 10, interval: 100);
      Location.instance.onLocationChanged.listen((event) {
        add(UpdateSpeedEvent(position: event));
      });
    });
    on<UpdateSpeedEvent>((event, emit) {
      emit(LivelocationLoaded2(position: event.position.speed.toString()));
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 1000 * 12742 * asin(sqrt(a));
  }
}
