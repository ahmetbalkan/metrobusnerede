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
