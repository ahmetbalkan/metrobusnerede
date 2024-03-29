import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:math';
import '../../models/bus_stop.dart';
import '../../models/next_stop_name_distance.dart';
import '../../repository/repository.dart';

part 'current_stop_event.dart';
part 'current_stop_state.dart';

MainPageModel mainPageModel = MainPageModel(0, "Yükleniyor", "Yükleniyor");

class CurrentStopBloc extends Bloc<CurrentStopEvent, CurrentStopState> {
  CurrentStopBloc()
      : super(const CurrentStopInitial(firstValue: "Yükleniyor.")) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];
    List<double> distanceList = [];

    on<UpdateCurrentStopEvent>((event, emit) async {
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
          emit(MyCurrentStopState(nextStopValue: busStoplist[i].name));
          if (minDistance < busStoplist[i].check / 2) {
            emit(MyCurrentStopState(nextStopValue: busStoplist[i].name));
          } else {
            emit(const MyCurrentStopState(nextStopValue: "ilerliyor"));
          }
        }
      }

      busStoplist.clear();
      distanceList.clear();
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
