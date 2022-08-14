import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'repository/repository.dart';

final locator = GetIt.I;

void locatorMethod() async {
  locator.registerLazySingleton(() => LocationRepository());
  locator.registerLazySingleton(() => Location());
}
