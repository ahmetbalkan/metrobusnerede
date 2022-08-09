part of 'distance_alarm_stop_bloc.dart';

abstract class DistanceAlarmStopState extends Equatable {
  final int nextStop;
  const DistanceAlarmStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class DistanceAlarmStopInitial extends DistanceAlarmStopState {
  DistanceAlarmStopInitial({required int firstValue})
      : super(nextStop: firstValue);
}

class MyDistanceAlarmStopState extends DistanceAlarmStopState {
  MyDistanceAlarmStopState({required int NextStopValue})
      : super(nextStop: NextStopValue);
}
