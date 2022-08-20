import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import '../../locator.dart';
import '../../repository/repository.dart';
part 'livelocation_event.dart';
part 'livelocation_state.dart';

class LivelocationBloc extends Bloc<LivelocationEvent, LivelocationState> {
  final locationRepository = locator.get<LocationRepository>();
  final location = locator.get<Location>();
  LivelocationBloc() : super(LivelocationLoading()) {
    settings();
    on<LoadLocationEvent>((event, emit) async {
      location.onLocationChanged.listen((event) async {
        add(UpdateLocationEvent(position: event));
      });
    });
    on<UpdateLocationEvent>((event, emit) {
      double speed = (event.position.speed * 18) / 5;
      emit(LivelocationLoaded(position: event.position));
    });
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
}