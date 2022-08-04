import 'package:get_it/get_it.dart';
import 'repository/repository.dart';

final locator = GetIt.I;

void locatorMethod() {
  locator.registerLazySingleton(() => LocationRepository());
}
