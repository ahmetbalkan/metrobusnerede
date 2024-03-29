part of 'distance_alarm_stop_bloc.dart';

abstract class DistanceAlarmStopEvent extends Equatable {
  const DistanceAlarmStopEvent();

  @override
  List<Object> get props => [];
}

class UpdateDistanceAlarmStopEvent extends DistanceAlarmStopEvent {
  final String alarmStopName;
  final Position position;
  final BuildContext context;

  const UpdateDistanceAlarmStopEvent(
      {required this.context,
      required this.alarmStopName,
      required this.position});

  @override
  List<Object> get props => [alarmStopName, position, context];
}
