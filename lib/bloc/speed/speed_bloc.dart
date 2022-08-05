import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import '../../models/busStop.dart';
import '../../repository/repository.dart';

part 'speed_event.dart';
part 'speed_state.dart';

class SpeedLocationBloc extends Bloc<SpeedLocationEvent, SpeedLocationState> {
  final locationRepository = LocationRepository();
  List<busStop> busStoplist = [];
  List<double> distanceList = [];
  SpeedLocationBloc() : super(SpeedlocationLoading()) {
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
          accuracy: LocationAccuracy.high, distanceFilter: 20, interval: 100);
      Location.instance.onLocationChanged.listen((event) {
        add(UpdateSpeedEvent(position: event));
      });
    });
    on<UpdateSpeedEvent>((event, emit) {
      emit(SpeedLocationLoaded(position: event.position.speed!.toInt()));
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
