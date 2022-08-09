import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../locator.dart';
import '../../repository/repository.dart';

part 'alarm_name_state.dart';

class AlarmNameCubit extends Cubit<AlarmNameState> {
  final locationRepository = locator.get<LocationRepository>();
  AlarmNameCubit() : super(AlarmNameInitial(alarmid: "SECILMEDI."));

  void setAlarm(int id) async {
    var alarmidname = await locationRepository.ListTobusStopName(id);
    emit(UpdateAlarmNameState(alarmid: alarmidname));
  }
}
