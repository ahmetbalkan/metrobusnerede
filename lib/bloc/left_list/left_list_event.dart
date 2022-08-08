part of 'left_list_bloc.dart';

abstract class LeftListEvent extends Equatable {
  const LeftListEvent();

  @override
  List<Object> get props => [];
}

class UpdateLeftListEvent extends LeftListEvent {
  final String nextStopName;
  const UpdateLeftListEvent({required this.nextStopName});

  @override
  List<Object> get props => [nextStopName];
}
