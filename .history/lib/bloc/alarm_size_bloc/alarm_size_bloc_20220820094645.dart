import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alarm_size_event.dart';
part 'alarm_size_state.dart';

class AlarmSizeBloc extends Bloc<AlarmSizeEvent, AlarmSizeState> {
  AlarmSizeBloc() : super(const AlarmSizeInitial(alarmSize: 0)) {
    on<UpdateAlarmSizeEvent>((event, emit) {
      if (event.way == 1) {
        //bduzu
        if (event.alarmid == 77) {
          emit(AlarmStopState(updateid: 0));
        } else {
          int size = event.nextStop - event.alarmid;
          if (size < 0) {
            emit(AlarmStopState(updateid: 78));
          } else {
            emit(AlarmStopState(updateid: size));
          }
          emit(AlarmStopState(updateid: size));
        }
      }

      if (event.way == 0) {
        if (event.alarmid == 77) {
          emit(AlarmStopState(updateid: 0));
        } else {
          int size = event.alarmid - event.nextStop;
          if (size < 0) {
            emit(AlarmStopState(updateid: 78));
          } else {
            emit(AlarmStopState(updateid: size));
          }
        }
      }
    });
  }
}
