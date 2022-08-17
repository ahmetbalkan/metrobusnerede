part of 'alarm_bloc.dart';

abstract class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object> get props => [];
}

class LoadAlarmEvent extends AlarmEvent {
  final String alarm;

  const LoadAlarmEvent({required this.alarm});
  @override
  List<Object> get props => [alarm];
}

class UpdateAlarmEvent extends AlarmEvent {
  final int distancealarm;

  const UpdateAlarmEvent({required this.distancealarm});
  @override
  List<Object> get props => [distancealarm];
}
