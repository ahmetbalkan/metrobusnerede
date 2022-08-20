part of 'perm_check_cubit.dart';

abstract class PermCheckState extends Equatable {
  final bool checkperm;
  const PermCheckState({required this.checkperm});

  @override
  List<Object> get props => [];
}

class PermCheckInitial extends PermCheckState {
  PermCheckInitial({required bool permstatus}) : super(checkperm: permstatus);
}

class UpdateAlarmNameState extends AlarmNameState {
  const UpdateAlarmNameState({required String alarmid})
      : super(alarmname: alarmid);
}
