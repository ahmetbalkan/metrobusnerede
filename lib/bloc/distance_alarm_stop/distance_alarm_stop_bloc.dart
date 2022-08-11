import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:metrobusnerede/location.dart';
import 'package:metrobusnerede/notofications.dart';
import 'dart:math';
import '../../models/bus_stop.dart';
import '../../repository/repository.dart';
part 'distance_alarm_stop_event.dart';
part 'distance_alarm_stop_state.dart';

class DistanceAlarmStopBloc
    extends Bloc<DistanceAlarmStopEvent, DistanceAlarmStopState> {
  DistanceAlarmStopBloc()
      : super(const DistanceAlarmStopInitial(firstValue: 0)) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];
    bool check = true;

    on<UpdateDistanceAlarmStopEvent>((event, emit) async {
      busStoplist = await locationRepository.busStopList();
      for (var i = 0; i < busStoplist.length; i++) {
        if (busStoplist[i].name == event.alarmStopName) {
          double alarmdistance = await calculateDistance(
              event.position.latitude,
              event.position.longitude,
              busStoplist[i].latitude,
              busStoplist[i].longitude);
          if (check) {
            if (alarmdistance < busStoplist[i].check) {
              createAlarmNotification(busStoplist[i].name);
            }
            check = false;
          }
          emit(MyDistanceAlarmStopState(nextStopValue: alarmdistance.toInt()));
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
