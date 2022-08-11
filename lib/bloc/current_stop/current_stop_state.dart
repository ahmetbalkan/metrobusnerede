part of 'current_stop_bloc.dart';

abstract class CurrentStopState extends Equatable {
  final String nextStop;
  const CurrentStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class CurrentStopInitial extends CurrentStopState {
  const CurrentStopInitial({required String firstValue})
      : super(nextStop: firstValue);
}

class MyCurrentStopState extends CurrentStopState {
  const MyCurrentStopState({required String nextStopValue})
      : super(nextStop: nextStopValue);
}
