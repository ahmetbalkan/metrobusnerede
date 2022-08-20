part of 'alarm_size_bloc.dart';

abstract class AlarmSizeState extends Equatable {
  final int AlarmSize;
  const AlarmSizeState({required this.AlarmSize});

  @override
  List<Object> get props => [];
}

class AlarmSizeInitial extends AlarmSizeState {
  const AlarmSizeInitial({required int AlarmSize})
      : super(alarmDistance: firstValue, busStopCount: firstbusStopCount);
}
