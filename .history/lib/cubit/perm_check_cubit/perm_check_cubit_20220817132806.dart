import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../locator.dart';
import '../../repository/repository.dart';

part 'perm_check_state.dart';

class PermCheckCubit extends Cubit<PermCheckState> {
  final locationRepository = locator.get<LocationRepository>();
  PermCheckCubit() : super(PermCheckInitial(permstatus: false));

  void checkPerm() async {
    check = await locationRepository.permCheck();
    emit();
  }
}
