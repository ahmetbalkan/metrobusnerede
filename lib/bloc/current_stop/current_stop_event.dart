part of 'current_stop_bloc.dart';

abstract class CurrentStopEvent extends Equatable {
  const CurrentStopEvent();

  @override
  List<Object> get props => [];
}

class UpdateCurrentStopEvent extends CurrentStopEvent {
  final LocationData position;

  const UpdateCurrentStopEvent({required this.position});
  @override
  List<Object> get props => [position];
}
