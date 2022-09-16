// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'alarm_bloc.dart';

abstract class AlarmState extends Equatable {
  const AlarmState();

  @override
  List<Object> get props => [];
}

class AlarmLoading extends AlarmState {}

class AlarmLoaded extends AlarmState {}

class AlarmError extends AlarmState {}
