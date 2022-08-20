part of 'alarm_name_cubit.dart';

abstract class AlarmNameState extends Equatable {
  final String alarmname;
  const AlarmNameState({required this.alarmname});

  @override
  List<Object> get props => [alarmname];
}

class AlarmNameInitial extends AlarmNameState {
  const AlarmNameInitial({required String alarmid}) : super(alarmname: alarmid);
}

class UpdateAlarmNameState extends AlarmNameState {
  const UpdateAlarmNameState({required String alarmid})
      : super(alarmname: alarmid);
}
