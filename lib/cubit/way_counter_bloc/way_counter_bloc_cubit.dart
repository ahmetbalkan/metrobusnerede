import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'way_counter_bloc_state.dart';

class WayCounterBlocCubit extends Cubit<WayCounterBlocState> {
  WayCounterBlocCubit() : super(WayCounterBlocInitial(Firstway: 0));

  void Beylikduzu() {
    emit(WayCounterState(CounterWay: 1));
  }

  void SogutluCesme() {
    emit(WayCounterState(CounterWay: 0));
  }
}
