part of 'way_counter_bloc_cubit.dart';

abstract class WayCounterBlocState extends Equatable {
  final int way;
  const WayCounterBlocState({required this.way});

  @override
  List<Object> get props => [way];
}

class WayCounterBlocInitial extends WayCounterBlocState {
  WayCounterBlocInitial({required int Firstway}) : super(way: Firstway);
}

class WayCounterState extends WayCounterBlocState {
  WayCounterState({required int CounterWay}) : super(way: CounterWay);
}
