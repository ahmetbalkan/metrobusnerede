part of 'current_stop_bloc.dart';

abstract class CurrentStopEvent extends Equatable {
  const CurrentStopEvent();

  @override
  List<Object> get props => [];
}

class UpdateCurrentStopEvent extends CurrentStopEvent {
  final LocationData position;
  final int way;
  const UpdateCurrentStopEvent({required this.position, required this.way});
  @override
  List<Object> get props => [position];
}
