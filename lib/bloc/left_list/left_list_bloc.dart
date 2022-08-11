import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import '../../models/bus_stop.dart';
import '../../repository/repository.dart';

part 'left_list_event.dart';
part 'left_list_state.dart';

class LeftListBloc extends Bloc<LeftListEvent, LeftListState> {
  LeftListBloc() : super(const LeftListInitial(firstValue: 0)) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];

    on<UpdateLeftListEvent>((event, emit) async {
      busStoplist = await locationRepository.busStopList();
      for (var i = 0; i < busStoplist.length; i++) {
        if (busStoplist[i].name == event.nextStopName) {
          if (event.way == 0) {
            emit(MyLeftListState(nextStopValue: i - 1));
          }
          if (event.way == 1) {
            emit(MyLeftListState(nextStopValue: i + 1));
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
