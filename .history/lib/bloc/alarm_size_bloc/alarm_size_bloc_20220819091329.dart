import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alarm_size_event.dart';
part 'alarm_size_state.dart';

class AlarmSizeBloc extends Bloc<AlarmSizeEvent, AlarmSizeState> {
  AlarmSizeBloc() : super(AlarmSizeInitial(AlarmSize: 0)) {
    on<UpdateAlarmSizeEvent>((event, emit) {});
  }
}
