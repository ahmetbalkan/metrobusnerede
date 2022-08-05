part of 'current_stop_bloc.dart';

abstract class CurrentStopState extends Equatable {
  const CurrentStopState();

  @override
  List<Object> get props => [];
}

class CurrentStopLoading extends CurrentStopState {}

class CurrentStopLoaded extends CurrentStopState {
  final int busStop;
  const CurrentStopLoaded({required this.busStop});
  @override
  List<Object> get props => [busStop];
}

class CurrentStopError extends CurrentStopState {}
