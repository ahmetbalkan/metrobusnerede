part of 'distance_next_stop_bloc.dart';

abstract class DistanceNextStopState extends Equatable {
  final int nextStop;
  const DistanceNextStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class DistanceNextStopInitial extends DistanceNextStopState {
  DistanceNextStopInitial({required int firstValue})
      : super(nextStop: firstValue);
}

class MyDistanceNextStopState extends DistanceNextStopState {
  MyDistanceNextStopState({required int NextStopValue})
      : super(nextStop: NextStopValue);
}
