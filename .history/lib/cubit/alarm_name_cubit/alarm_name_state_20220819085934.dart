part of 'alarm_name_cubit.dart';

abstract class AlarmNameState extends Equatable {
  final String alarmname;
  final String alarmid;
  const AlarmNameState({required this.alarmname, required this.alarmname});

  @override
  List<Object> get props => [alarmname];
}

class AlarmNameInitial extends AlarmNameState {
  const AlarmNameInitial({required String alarmid}) : super(alarmname: alarmid);
}

class UpdateAlarmNameState extends AlarmNameState {
  const UpdateAlarmNameState(
      {required String alarmidString, required int alarmid})
      : super(alarmname: alarmidString, alarmid: alarmid);
}
