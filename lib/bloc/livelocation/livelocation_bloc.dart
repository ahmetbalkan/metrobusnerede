import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../locator.dart';
import '../../repository/repository.dart';
part 'livelocation_event.dart';
part 'livelocation_state.dart';

class LivelocationBloc extends Bloc<LivelocationEvent, LivelocationState> {
  late LocationSettings locationSettings;
  StreamSubscription? _streamSubscription;

  LivelocationBloc() : super(LivelocationLoading()) {
    settings();
    on<LoadLocationEvent>((event, emit) async {
      _streamSubscription?.cancel();
      try {
        _streamSubscription =
            Geolocator.getPositionStream(locationSettings: locationSettings)
                .listen((Position position) {
          add(UpdateLocationEvent(position: position));
        });
      } catch (e) {
        print(e);
      }
    });
    on<UpdateLocationEvent>((event, emit) async {
      double speed = (event.position.speed * 18) / 5;
      emit(LivelocationLoaded(position: event.position, speed: speed));
    });
  }

  void settings() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
          intervalDuration: const Duration(seconds: 1),
          foregroundNotificationConfig: ForegroundNotificationConfig(
            notificationText:
                "Metrobüs Nerede Uygulaması şuan konumunuza erişim sağlıyor.",
            notificationTitle: "Metrobüs Nerede",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.automotiveNavigation,
        distanceFilter: 5,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      );
    }
  }
}
