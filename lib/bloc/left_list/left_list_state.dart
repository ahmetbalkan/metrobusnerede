part of 'left_list_bloc.dart';

abstract class LeftListState extends Equatable {
  final int nextStop;
  const LeftListState({required this.nextStop});

  @override
  List<Object> get props => [nextStop];
}

class LeftListInitial extends LeftListState {
  const LeftListInitial({required int firstValue})
      : super(nextStop: firstValue);
}

class MyLeftListState extends LeftListState {
  const MyLeftListState({required int nextStopValue})
      : super(nextStop: nextStopValue);
}
