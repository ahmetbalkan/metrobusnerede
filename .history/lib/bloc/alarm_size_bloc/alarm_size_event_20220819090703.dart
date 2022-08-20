part of 'alarm_size_bloc.dart';

abstract class AlarmSizeEvent extends Equatable {
  final int nextStop;
  int
  const AlarmSizeEvent();

  @override
  List<Object> get props => [];
}

class UpdateDistanceAlarmStopEvent extends AlarmSizeEvent {
  final int nextStop;
  final int alarmid;


  const UpdateDistanceAlarmStopEvent(
      {required this.context,
      required this.alarmStopName,
      required this.position});

  @override
  List<Object> get props => [alarmStopName, position, context];
}