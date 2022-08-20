part of 'perm_check_cubit.dart';

abstract class PermCheckState extends Equatable {
  bool checkperm;
  const PermCheckState();

  @override
  List<Object> get props => [];
}

class PermCheckInitial extends PermCheckState {}
