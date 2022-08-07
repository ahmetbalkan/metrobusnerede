import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location_distance_calculator/location_distance_calculator.dart';
import 'package:metrobusnerede/cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import 'package:metrobusnerede/location.dart';
import 'dart:math';
import '../../models/busStop.dart';
import '../../repository/repository.dart';

part 'next_stop_event.dart';
part 'next_stop_state.dart';

class NextStopBloc extends Bloc<NextStopEvent, NextStopState> {
  NextStopBloc() : super(NextStopInitial(firstValue: "Yükleniyor.")) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];
    List<double> distanceList = [];
    int count = 0;
    int nearWay = 0;
    on<UpdateNextStopEvent>((event, emit) async {
      int way = event.way;
      if (event != null) {
        busStoplist = await locationRepository.BusStopList();

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
            double a = await calculateDistance(
                event.position.latitude,
                event.position.longitude,
                busStoplist[i].latitude,
                busStoplist[i].longitude);
            if (way == 0) {
              emit(MyNextStopState(NextStopValue: busStoplist[i + 1].name));
            }
            if (way == 1) {
              emit(MyNextStopState(NextStopValue: busStoplist[i - 1].name));
            }
          }
        }

        busStoplist.clear();
        distanceList.clear();
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
