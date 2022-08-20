import 'package:bloc/bloc.dart';

import '../locator.dart';

import '../models/bus_stop.dart';
import '../repository/repository.dart';

class PermCheckCubit extends Cubit<bool> {
  PermCheckCubit() : super(false);

  final locationRepository = locator.get<LocationRepository>();

  Future<void> permcheck() async {
    emit(await locationRepository.permCheck());
  }
}
