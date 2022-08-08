part of 'distance_next_stop_bloc.dart';

abstract class DistanceNextStopEvent extends Equatable {
  const DistanceNextStopEvent();

  @override
  List<Object> get props => [];
}

class UpdateDistanceNextStopEvent extends DistanceNextStopEvent {
  final String nextStopName;
  final LocationData position;
  final int way;
  const UpdateDistanceNextStopEvent(
      {required this.nextStopName, required this.position, required this.way});

  @override
  List<Object> get props => [nextStopName, way];
}
