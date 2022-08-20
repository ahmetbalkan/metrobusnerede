part of 'alarm_size_bloc.dart';

abstract class AlarmSizeEvent extends Equatable {
  const AlarmSizeEvent();

  @override
  List<Object> get props => [];
}

class UpdateAlarmSizeEvent extends AlarmSizeEvent {
  final int nextStop;
  final int alarmid;
  final int way;

  const UpdateAlarmSizeEvent(
      {required this.nextStop, required this.alarmid, required this.way});
  @override
  List<Object> get props => [nextStop, alarmid];
}
