part of 'distance_alarm_stop_bloc.dart';

abstract class DistanceAlarmStopState extends Equatable {
  final int alarmDistance;
  final int busStopCount;

  const DistanceAlarmStopState(
      {required this.alarmDistance, required this.busStopCount});

  @override
  List<Object> get props => [alarmDistance, busStopCount];
}

class DistanceAlarmStopInitial extends DistanceAlarmStopState {
  const DistanceAlarmStopInitial(
      {required int firstValue, required int firstbusStopCount})
      : super(alarmDistance: firstValue, busStopCount: firstbusStopCount);
}

class MyDistanceAlarmStopState extends DistanceAlarmStopState {
  const MyDistanceAlarmStopState(
      {required int distanceValue, required int firstbusStopCount})
      : super(alarmDistance: distanceValue, busStopCount: firstbusStopCount);
}
