part of 'current_stop_bloc.dart';

abstract class CurrentStopEvent extends Equatable {
  const CurrentStopEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrentStopEvent extends CurrentStopEvent {}

class UpdateCurrentStopEvent extends CurrentStopEvent {
  final int busStop;
  const UpdateCurrentStopEvent({required this.busStop});
  @override
  List<Object> get props => [busStop];
}
