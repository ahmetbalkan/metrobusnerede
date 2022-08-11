part of 'distance_alarm_stop_bloc.dart';

abstract class DistanceAlarmStopState extends Equatable {
  final int nextStop;
  const DistanceAlarmStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class DistanceAlarmStopInitial extends DistanceAlarmStopState {
  const DistanceAlarmStopInitial({required int firstValue})
      : super(nextStop: firstValue);
}

class MyDistanceAlarmStopState extends DistanceAlarmStopState {
  const MyDistanceAlarmStopState({required int nextStopValue})
      : super(nextStop: nextStopValue);
}
