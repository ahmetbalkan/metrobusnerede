import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:metrobusnerede/notification.dart';
import 'repository/repository.dart';

final locator = GetIt.I;

void locatorMethod() async {
  locator.registerLazySingleton(() => LocationRepository());
  locator.registerLazySingleton(() => LocalNotificationService());
  locator.registerLazySingleton(() => Location());
}
