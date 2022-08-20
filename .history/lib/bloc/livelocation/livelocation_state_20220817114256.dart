// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'livelocation_bloc.dart';

abstract class LivelocationState extends Equatable {
  const LivelocationState();

  @override
  List<Object> get props => [];
}

class LivelocationLoading extends LivelocationState {}

class LivelocationLoaded extends LivelocationState {
  final LocationData position;
  final int speed;
  const LivelocationLoaded({required this.position});
  @override
  List<Object> get props => [position];
}

class LivelocationError extends LivelocationState {}
