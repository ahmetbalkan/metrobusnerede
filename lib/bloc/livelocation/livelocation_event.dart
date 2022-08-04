part of 'livelocation_bloc.dart';

abstract class LivelocationEvent extends Equatable {
  const LivelocationEvent();

  @override
  List<Object> get props => [];
}

class LeftBusStopEvent extends LivelocationEvent {}

class UpdateLeftBusStopEvent extends LivelocationEvent {
  final LocationData position;
  const UpdateLeftBusStopEvent({required this.position});
  @override
  List<Object> get props => [position];
}

class LoadSpeedEvent extends LivelocationEvent {}

class UpdateSpeedEvent extends LivelocationEvent {
  final LocationData position;
  const UpdateSpeedEvent({required this.position});
  @override
  List<Object> get props => [position];
}
