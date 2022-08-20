part of 'perm_check_cubit.dart';

abstract class PermCheckState extends Equatable {
  final bool checkperm;
  const PermCheckState({required bool checkperm}) : super();

  @override
  List<Object> get props => [];
}

class PermCheckInitial extends PermCheckState {}
