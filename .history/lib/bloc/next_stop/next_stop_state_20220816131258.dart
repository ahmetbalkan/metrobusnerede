part of 'next_stop_bloc.dart';

abstract class NextStopState extends Equatable {
  final String nextStop;
  const NextStopState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class NextStopInitial extends NextStopState {
  const NextStopInitial({required String firstValue})
      : super(nextStop: firstValue);
}

class MyNextStopState extends NextStopState {
  const MyNextStopState({required String nextStopValue})
      : super(nextStop: nextStopValue);
}
