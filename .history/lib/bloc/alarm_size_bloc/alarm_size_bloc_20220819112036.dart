import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alarm_size_event.dart';
part 'alarm_size_state.dart';

class AlarmSizeBloc extends Bloc<AlarmSizeEvent, AlarmSizeState> {
  AlarmSizeBloc() : super(const AlarmSizeInitial(alarmSize: 0)) {
    on<UpdateAlarmSizeEvent>((event, emit) {
      if (event.way == 1) {
        //bduzu
        int size = event.nextStop - event.alarmid;
        emit(AlarmStopState(updateid: size));
      }

      if (event.way == 0) {
        if (event.alarmid == 0) {
          emit(AlarmStopState(updateid: 0));
        } else {
          int size = event.alarmid - event.nextStop;
          emit(AlarmStopState(updateid: size));
        }
      }
    });
  }
}
