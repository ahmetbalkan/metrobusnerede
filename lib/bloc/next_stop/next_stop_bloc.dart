import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:metrobusnerede/location.dart';

part 'next_stop_event.dart';
part 'next_stop_state.dart';

class NextStopBloc extends Bloc<NextStopEvent, NextStopState> {
  NextStopBloc() : super(NextStopInitial(firstValue: "Yükleniyor.")) {
    on<UpdateNextStopEvent>((event, emit) {
      emit(MyNextStopState(NextStopValue: event.position.speed.toString()));
    });
  }
}
