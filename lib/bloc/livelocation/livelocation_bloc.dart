import 'dart:ffi';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../locator.dart';
import '../../repository/repository.dart';

part 'livelocation_event.dart';
part 'livelocation_state.dart';

class LivelocationBloc extends Bloc<LivelocationEvent, LivelocationState> {
  final locationRepository = LocationRepository();
  LivelocationBloc() : super(LivelocationLoading()) {
    settings();
    on<LoadLocationEvent>((event, emit) async {
      Location.instance.requestPermission();
      Location.instance.onLocationChanged.listen((event) async {
        add(UpdateLocationEvent(position: event));
      });
    });
    on<UpdateLocationEvent>((event, emit) {
      emit(LivelocationLoaded(position: event.position));
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

  void settings() async {
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
        accuracy: LocationAccuracy.high, distanceFilter: 10, interval: 1000);
  }
}
