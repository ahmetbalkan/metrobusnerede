import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../locator.dart';
import '../models/busStop.dart';
import '../repository/repository.dart';

class ListCubit extends Cubit<List<busStop>> {
  ListCubit() : super(<busStop>[]);

  final locationRepository = locator.get<LocationRepository>();

  Future<void> loadBusstopList() async {
    var list = await locationRepository.BusStopList();
    emit(list);
  }
}
