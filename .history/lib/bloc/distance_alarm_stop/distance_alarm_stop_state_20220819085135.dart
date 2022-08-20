part of 'distance_alarm_stop_bloc.dart';

abstract class DistanceAlarmStopState extends Equatable {
  final int alarmDistance;
  final int busStopCount;

  const DistanceAlarmStopState(
      {required this.alarmDistance, required this.busStopCount});

  @override
  List<Object> get props => [nextStop];
}

class DistanceAlarmStopInitial extends DistanceAlarmStopState {
  const DistanceAlarmStopInitial({required int firstValue})
      : super(alarmDistance: firstValue);
}

class MyDistanceAlarmStopState extends DistanceAlarmStopState {
  const MyDistanceAlarmStopState({required int distanceValue})
      : super(alarmDistance: distanceValue);
}
