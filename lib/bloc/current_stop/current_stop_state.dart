part of 'current_stop_bloc.dart';

abstract class CurrentStopState extends Equatable {
  final String nextStop;
  const CurrentStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class CurrentStopInitial extends CurrentStopState {
  CurrentStopInitial({required String firstValue})
      : super(nextStop: firstValue);
}

class MyCurrentStopState extends CurrentStopState {
  MyCurrentStopState({required String NextStopValue})
      : super(nextStop: NextStopValue);
}
