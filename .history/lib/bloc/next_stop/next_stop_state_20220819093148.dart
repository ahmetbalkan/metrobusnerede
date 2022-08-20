part of 'next_stop_bloc.dart';

abstract class NextStopState extends Equatable {
  final String nextStop;
  final int nextStopid;
  const NextStopState({required this.nextStop, required this.nextStopid});

  @override
  List<Object> get props => [nextStop, nextStopid];
}

class NextStopInitial extends NextStopState {
  const NextStopInitial(
      {required String firstValue, required int firstnextStopid})
      : super(nextStop: firstValue, nextStopid: firstnextStopid);
  @override
  List<Object> get props => [nextStop, nextStopid];
}

class MyNextStopState extends NextStopState {
  const MyNextStopState(
      {required String nextStopValue, required int nextstopid})
      : super(nextStop: nextStopValue, nextStopid: nextstopid);
}
