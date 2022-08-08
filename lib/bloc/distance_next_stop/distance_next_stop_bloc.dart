import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:location_distance_calculator/location_distance_calculator.dart';
import 'package:metrobusnerede/cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import 'package:metrobusnerede/location.dart';
import 'dart:math';
import '../../models/busStop.dart';
import '../../repository/repository.dart';
import 'dart:developer';
part 'distance_next_stop_event.dart';
part 'distance_next_stop_state.dart';

class DistanceNextStopBloc
    extends Bloc<DistanceNextStopEvent, DistanceNextStopState> {
  DistanceNextStopBloc() : super(DistanceNextStopInitial(firstValue: 0)) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];

    on<UpdateDistanceNextStopEvent>((event, emit) async {
      busStoplist = await locationRepository.BusStopList();
      if (event != null) {
        for (var i = 0; i < busStoplist.length; i++) {
          if (busStoplist[i].name == event.nextStopName) {
            double bduzudistance = await calculateDistance(
                event.position.latitude,
                event.position.longitude,
                busStoplist[i].latitude,
                busStoplist[i].longitude);
            emit(MyDistanceNextStopState(NextStopValue: bduzudistance.toInt()));
          }
        }
      }
    });
  }
}

Future<double> calculateDistance(lat1, lon1, lat2, lon2) async {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 1000 * 12742 * asin(sqrt(a));
}
