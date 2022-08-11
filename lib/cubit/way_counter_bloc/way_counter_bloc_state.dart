part of 'way_counter_bloc_cubit.dart';

abstract class WayCounterBlocState extends Equatable {
  final int way;
  const WayCounterBlocState({required this.way});

  @override
  List<Object> get props => [way];
}

class WayCounterBlocInitial extends WayCounterBlocState {
  const WayCounterBlocInitial({required int firstway}) : super(way: firstway);
}

class WayCounterState extends WayCounterBlocState {
  const WayCounterState({required int counterWay}) : super(way: counterWay);
}
