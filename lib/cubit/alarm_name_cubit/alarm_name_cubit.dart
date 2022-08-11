import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../locator.dart';
import '../../repository/repository.dart';
part 'alarm_name_state.dart';

class AlarmNameCubit extends Cubit<AlarmNameState> {
  final locationRepository = locator.get<LocationRepository>();
  AlarmNameCubit() : super(const AlarmNameInitial(alarmid: "SECILMEDI."));

  void setAlarm(int id) async {
    var alarmidname = await locationRepository.listTobusStopName(id);
    emit(UpdateAlarmNameState(alarmid: alarmidname));
  }
}
