part of 'alarm_size_bloc.dart';

abstract class AlarmSizeState extends Equatable {
  final int alarmSize;
  const AlarmSizeState({required this.alarmSize});

  @override
  List<Object> get props => [alarmSize];
}

class AlarmSizeInitial extends AlarmSizeState {
  const AlarmSizeInitial({required int alarmSize})
      : super(alarmSize: alarmSize);
  @override
  List<Object> get props => [alarmSize];
}

class AlarmStopState extends AlarmSizeState {
  const AlarmStopState({required int updateid}) : super(alarmSize: updateid);
}
