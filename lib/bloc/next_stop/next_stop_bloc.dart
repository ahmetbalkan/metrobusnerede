import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location_distance_calculator/location_distance_calculator.dart';
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
    int count, way = 0;
    on<UpdateNextStopEvent>((event, emit) async {
      if (event != null) {
        print(event.position.latitude);
        busStoplist = await locationRepository.BusStopList();

        for (var i = 0; i < busStoplist.length; i++) {
          double distance = await calculateDistance(
              busStoplist[i].latitude,
              busStoplist[i].longitude,
              event.position.latitude,
              event.position.longitude);
          distanceList.add(distance);
        }

        double minDistance = await findMin(distanceList);
        print("min dis " + minDistance.toString());
        /*   for (int i = 0; i < busStoplist.length; i++) {
          double distance = await LocationDistanceCalculator().distanceBetween(
              busStoplist[i].latitude,
              busStoplist[i].longitude,
              eventlati!,
              eventlongi!);

          
        }
      }  else {
        emit(MyNextStopState(NextStopValue: "Konum Alınamıyor"));
      }*/
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
