import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrobusnerede/bloc/distance_next_stop/distance_next_stop_bloc.dart';
import 'package:metrobusnerede/bloc/left_list/left_list_bloc.dart';
import 'package:metrobusnerede/bloc/livelocation/livelocation_bloc.dart';
import 'package:metrobusnerede/bloc/next_stop/next_stop_bloc.dart';
import 'package:metrobusnerede/cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import 'Homepage_widget.dart';
import 'bloc/current_stop/current_stop_bloc.dart';
import 'constant/color.dart';
import 'cubit/list_cubit.dart';
import 'locator.dart';

void main() {
  locatorMethod();
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
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Metrobüs Nerede?',
              theme: ThemeData(
                fontFamily: 'Armata',
                primarySwatch: Colors.blue,
              ),
              home: const MyHomePage(),
            ),
          );
        });
  }
}
