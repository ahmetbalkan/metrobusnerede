import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'perm_check_state.dart';

class PermCheckCubit extends Cubit<PermCheckState> {
  PermCheckCubit() : super(PermCheckInitial());
}
