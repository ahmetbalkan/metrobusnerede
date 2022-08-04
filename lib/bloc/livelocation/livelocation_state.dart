// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'livelocation_bloc.dart';

abstract class LivelocationState extends Equatable {
  const LivelocationState();

  @override
  List<Object> get props => [];
}

class LivelocationLoading extends LivelocationState {}

class LivelocationLoaded extends LivelocationState {
  final String position;
  const LivelocationLoaded({required this.position});
  @override
  List<Object> get props => [position];
}

class LivelocationError extends LivelocationState {}

class LivelocationLoading2 extends LivelocationState {}

class LivelocationLoaded2 extends LivelocationState {
  final String position;
  const LivelocationLoaded2({required this.position});
  @override
  List<Object> get props => [position];
}

class LivelocationError2 extends LivelocationState {}
