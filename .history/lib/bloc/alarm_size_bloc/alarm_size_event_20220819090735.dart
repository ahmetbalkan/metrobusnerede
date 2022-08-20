part of 'alarm_size_bloc.dart';

abstract class AlarmSizeEvent extends Equatable {
  final int nextStop;
  int
  const AlarmSizeEvent();

  @override
  List<Object> get props => [];
}

class UpdateAlarmSizeEvent extends AlarmSizeEvent {
  final int nextStop;
  final int alarmid;


  const UpdateAlarmSizeEvent(
      {required this.nextStop,
      required this.alarmid});

  @override
  List<Object> get props => [nextStop, alarmid];
}