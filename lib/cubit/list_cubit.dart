import 'package:bloc/bloc.dart';

import '../locator.dart';

import '../models/bus_stop.dart';
import '../repository/repository.dart';

class ListCubit extends Cubit<List<busStop>> {
  ListCubit() : super(<busStop>[]);

  final locationRepository = locator.get<LocationRepository>();

  Future<void> loadBusstopList() async {
    var list = await locationRepository.busStopList();
    emit(list);
  }
}
