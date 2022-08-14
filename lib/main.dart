import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metrobusnerede/bloc/distance_alarm_stop/distance_alarm_stop_bloc.dart';
import 'package:metrobusnerede/bloc/distance_next_stop/distance_next_stop_bloc.dart';
import 'package:metrobusnerede/bloc/left_list/left_list_bloc.dart';
import 'package:metrobusnerede/bloc/livelocation/livelocation_bloc.dart';
import 'package:metrobusnerede/bloc/next_stop/next_stop_bloc.dart';
import 'package:metrobusnerede/cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import 'package:metrobusnerede/permission_page.dart';
import 'package:metrobusnerede/repository/repository.dart';
import 'Homepage/home_page_widget.dart';
import 'bloc/current_stop/current_stop_bloc.dart';
import 'constant/color.dart';
import 'cubit/alarm_name_cubit/alarm_name_cubit.dart';
import 'cubit/list_cubit.dart';
import 'locator.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('firsttime');
  await Hive.openBox('notif');
  var box = Hive.box('firsttime');
  var box2 = Hive.box('notif');
  box.put("firsttime", true);
  box2.put("notif", true);
  locatorMethod();

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/metrobuslogo',
      [
        NotificationChannel(
          channelKey: 'Metrobus_Nerede',
          channelName: 'Metrobus Nerede Bildirimi',
          channelDescription: 'Metrobus Nerede Bildirimi',
          defaultColor: materialBackgroundColor,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'metrobus_nerede',
            channelGroupName: 'Metrobus Nerede Bildirimi')
      ],
      debug: true);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark));
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
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Metrobüs Nerede?',
              theme: ThemeData(
                iconTheme: IconThemeData(color: Colors.red),
                scaffoldBackgroundColor: backgroundColor,
                backgroundColor: backgroundColor,
                fontFamily: 'Armata',
                primarySwatch: materialBackgroundColor,
              ),
              home: FutureBuilder<bool>(
                future: locationRepository.permCheck(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    return snapshot.data == true
                        ? const MyHomePage()
                        : const PermissionPage();
                  } else if (snapshot.hasError) {
                    return Text("snapshot.error");
                  } else {
                    return Scaffold(
                        backgroundColor: backgroundColor,
                        body: CircularProgressIndicator());
                  }
                },
              ),
            ),
          );
        });
  }
}
