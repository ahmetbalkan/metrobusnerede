import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/busStop.dart';
import '../repository/repository.dart';

class ListCubit extends Cubit<List<busStop>> {
  ListCubit() : super(<busStop>[]);

  final locationRepository = LocationRepository();

  Future<void> loadBusstopList() async {
    var list = await locationRepository.BusStopList();
    emit(list);
  }
}
