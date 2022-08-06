part of 'next_stop_bloc.dart';

abstract class NextStopEvent extends Equatable {
  const NextStopEvent();

  @override
  List<Object> get props => [];
}

class UpdateNextStopEvent extends NextStopEvent {
  final LocationData position;
  const UpdateNextStopEvent({required this.position});
  @override
  List<Object> get props => [position];
}
