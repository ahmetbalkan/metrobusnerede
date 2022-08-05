part of 'speed_bloc.dart';

abstract class SpeedLocationEvent extends Equatable {
  const SpeedLocationEvent();

  @override
  List<Object> get props => [];
}

class LoadSpeedEvent extends SpeedLocationEvent {}

class UpdateSpeedEvent extends SpeedLocationEvent {
  final LocationData position;
  const UpdateSpeedEvent({required this.position});
  @override
  List<Object> get props => [position];
}
