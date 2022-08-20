part of 'alarm_name_cubit.dart';

abstract class AlarmNameState extends Equatable {
  final String alarmname;
  final int alarmid;
  const AlarmNameState({required this.alarmname, required this.alarmid});

  @override
  List<Object> get props => [alarmname];
}

class AlarmNameInitial extends AlarmNameState {
  const AlarmNameInitial({required String alarmid, required int alarmidfirst})
      : super(alarmname: alarmid, alarmid: alarmidfirst);
}

class UpdateAlarmNameState extends AlarmNameState {
  const UpdateAlarmNameState({
    required String alarmname,
    required int alarmid,
  }) : super(alarmname: alarmname, alarmid: alarmid);
}
