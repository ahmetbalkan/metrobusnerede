import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'perm_check_state.dart';

class PermCheckCubit extends Cubit<PermCheckState> {
  PermCheckCubit() : super(PermCheckInitial(permstatus: true));

  void checkPerm() async {
    if (await Permission.locationWhenInUse.serviceStatus.isDisabled) {
      emit(UpdatePermCheckState(permcheck: false));
    } else {
      emit(UpdatePermCheckState(permcheck: true));
    }
  }
}