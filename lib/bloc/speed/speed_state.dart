// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'speed_bloc.dart';

abstract class SpeedLocationState extends Equatable {
  const SpeedLocationState();

  @override
  List<Object> get props => [];
}

class SpeedlocationLoading extends SpeedLocationState {}

class SpeedLocationLoaded extends SpeedLocationState {
  final int position;
  const SpeedLocationLoaded({required this.position});
  @override
  List<Object> get props => [position];
}

class SpeedLocationError extends SpeedLocationState {}
