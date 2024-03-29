import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metrobusnerede/bloc/alarm_size_bloc/alarm_size_bloc.dart';
import 'package:metrobusnerede/bloc/distance_alarm_stop/distance_alarm_stop_bloc.dart';
import 'package:metrobusnerede/bloc/distance_next_stop/distance_next_stop_bloc.dart';
import 'package:metrobusnerede/bloc/left_list/left_list_bloc.dart';
import 'package:metrobusnerede/bloc/livelocation/livelocation_bloc.dart';
import 'package:metrobusnerede/bloc/next_stop/next_stop_bloc.dart';
import 'package:metrobusnerede/cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import 'package:metrobusnerede/permission_page.dart';
import 'package:metrobusnerede/repository/repository.dart';
import 'Homepage/home_page_widget.dart';
import 'bloc/alarm_bloc/alarm_bloc.dart';
import 'bloc/current_stop/current_stop_bloc.dart';
import 'constant/color.dart';
import 'cubit/alarm_name_cubit/alarm_name_cubit.dart';
import 'cubit/list_cubit.dart';
import 'locator.dart';
import 'translate_class.dart';

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('firsttime');
  var box = Hive.box('firsttime');
  box.put("firsttime", true);
  await Hive.openBox('notif');
  var box2 = Hive.box('notif');
  box2.put("notif", true);
  locatorMethod();

  AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings(
    "ic_launcher",
  );

  MobileAds.instance.initialize();

  const IOSInitializationSettings iosInitializationSettings =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings, iOS: iosInitializationSettings);

  _flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (payload) async {
      if (payload != null) {
        debugPrint('notif payload' + payload);
      }
    },
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationRepository = locator.get<LocationRepository>();
    return ScreenUtilInit(
        designSize: const Size(444, 781),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ListCubit>(
                create: (BuildContext context) => ListCubit(),
              ),
              BlocProvider<WayCounterBlocCubit>(
                create: (BuildContext context) => WayCounterBlocCubit(),
              ),
              BlocProvider<LivelocationBloc>(
                  create: (BuildContext context) =>
                      LivelocationBloc()..add(LoadLocationEvent())),
              BlocProvider<CurrentStopBloc>(
                  create: (BuildContext context) => CurrentStopBloc()),
              BlocProvider<NextStopBloc>(
                  create: (BuildContext context) => NextStopBloc()),
              BlocProvider<DistanceNextStopBloc>(
                  create: (BuildContext context) => DistanceNextStopBloc()),
              BlocProvider<LeftListBloc>(
                  create: (BuildContext context) => LeftListBloc()),
              BlocProvider<AlarmNameCubit>(
                  create: (BuildContext context) => AlarmNameCubit()),
              BlocProvider<DistanceAlarmStopBloc>(
                  create: (BuildContext context) => DistanceAlarmStopBloc()),
              BlocProvider<AlarmSizeBloc>(
                  create: (BuildContext context) => AlarmSizeBloc()),
              BlocProvider<AlarmBloc>(
                  create: (BuildContext context) => AlarmBloc()),
            ],
            child: GetMaterialApp(
              translations: Messages(), // your translations
              locale: Get.deviceLocale,
              fallbackLocale: Locale('en', 'US'),
              debugShowCheckedModeBanner: false,
              title: 'Metrobüs Nerede?',
              theme: ThemeData(
                iconTheme: const IconThemeData(color: Colors.red),
                scaffoldBackgroundColor: backgroundColor,
                backgroundColor: backgroundColor,
                fontFamily: 'Armata',
                primarySwatch: materialBackgroundColor,
              ),
              home: FutureBuilder<bool>(
                future: locationRepository.permCheck(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data == true
                        ? const MyHomePage()
                        : const PermissionPage();
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Scaffold(
                        backgroundColor: backgroundColor,
                        body: const Text("mahmut"));
                  }
                },
              ),
            ),
          );
        });
  }
}
