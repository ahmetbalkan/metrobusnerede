import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';
import '../../../location.dart';
import '../../../models/busStop.dart';
import '../../../repository/repository.dart';

part 'current_stop_event.dart';
part 'current_stop_state.dart';

class CurrentStopBloc extends Bloc<CurrentStopEvent, CurrentStopState> {
  final locationRepository = LocationRepository();
  List<busStop> busStoplist = [];
  List<double> distanceList = [];
  CurrentStopBloc() : super(CurrentStopLoading()) {
    on<CurrentStopEvent>((event, emit) async {
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
          accuracy: LocationAccuracy.high, distanceFilter: 5, interval: 100);
      Location.instance.onLocationChanged.listen((event) async {
        busStoplist = await locationRepository.BusStopList();
        for (var i = 0; i < busStoplist.length; i++) {
          double distance = calculateDistance(event.latitude, event.longitude,
              busStoplist[i].latitude, busStoplist[i].longitude);
          distanceList.add(distance);
          distanceList.sort();
        }
        double minDistance = distanceList[0];
        for (int i = 0; i < busStoplist.length; i++) {
          if (calculateDistance(busStoplist[i].latitude,
                  busStoplist[i].longitude, event.latitude, event.longitude) ==
              minDistance) {
            print("busstop: " + busStoplist[i].busstopid.toString());
            add(UpdateCurrentStopEvent(busStop: busStoplist[i].busstopid));
          } else {}
        }
      });
    });

    on<UpdateCurrentStopEvent>((event1, emit) {
      emit(CurrentStopLoaded(busStop: event1.busStop));
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
