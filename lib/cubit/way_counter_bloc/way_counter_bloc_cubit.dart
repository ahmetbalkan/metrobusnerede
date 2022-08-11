import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'way_counter_bloc_state.dart';

class WayCounterBlocCubit extends Cubit<WayCounterBlocState> {
  WayCounterBlocCubit() : super(const WayCounterBlocInitial(firstway: 0));

  void beylikduzu() {
    emit(const WayCounterState(counterWay: 1));
  }

  void sogutluCesme() {
    emit(const WayCounterState(counterWay: 0));
  }
}
