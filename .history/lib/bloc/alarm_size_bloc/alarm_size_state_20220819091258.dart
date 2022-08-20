part of 'alarm_size_bloc.dart';

abstract class AlarmSizeState extends Equatable {
  final int AlarmSize;
  const AlarmSizeState({required this.AlarmSize});

  @override
  List<Object> get props => [AlarmSize];
}

class AlarmSizeInitial extends AlarmSizeState {
  const AlarmSizeInitial({required int AlarmSize})
      : super(AlarmSize: AlarmSize);
  @override
  List<Object> get props => [AlarmSize];
}

class AlarmStopState extends AlarmSizeState {
  const AlarmStopState({required int updateid})
      : super(alarmDistance: distanceValue, busStopCount: firstbusStopCount);
}
