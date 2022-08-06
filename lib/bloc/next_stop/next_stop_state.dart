part of 'next_stop_bloc.dart';

abstract class NextStopState extends Equatable {
  final String nextStop;
  const NextStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class NextStopInitial extends NextStopState {
  NextStopInitial({required String firstValue}) : super(nextStop: firstValue);
}

class MyNextStopState extends NextStopState {
  MyNextStopState({required String NextStopValue})
      : super(nextStop: NextStopValue);
}
