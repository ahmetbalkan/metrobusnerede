part of 'next_stop_bloc.dart';

abstract class NextStopEvent extends Equatable {
  const NextStopEvent();

  @override
  List<Object> get props => [];
}

class UpdateNextStopEvent extends NextStopEvent {
  final Position position;
  final int way;
  const UpdateNextStopEvent({required this.position, required this.way});

  @override
  List<Object> get props => [position, way];
}
