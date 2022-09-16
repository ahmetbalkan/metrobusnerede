import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../locator.dart';
import '../../repository/repository.dart';
part 'alarm_name_state.dart';

class AlarmNameCubit extends Cubit<AlarmNameState> {
  final locationRepository = locator.get<LocationRepository>();
  AlarmNameCubit()
      : super(AlarmNameInitial(alarmid: "secilmedi".tr, alarmidfirst: 77));

  void setAlarm(int id) async {
    var alarmidname = await locationRepository.listTobusStopName(id);
    emit(UpdateAlarmNameState(alarmid: id, alarmname: alarmidname));
  }
}
