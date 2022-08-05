import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrobusnerede/bloc/currentstop/bloc/current_stop_bloc.dart';
import 'bloc/speed/speed_bloc.dart';
import 'cubit/list_cubit.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
              BlocProvider<SpeedLocationBloc>(
                  create: (BuildContext context) =>
                      SpeedLocationBloc()..add(LoadSpeedEvent())),
              BlocProvider<CurrentStopBloc>(
                  create: (BuildContext context) =>
                      CurrentStopBloc()..add(LoadCurrentStopEvent())),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Metrobüs Nerede?',
              theme: ThemeData(
                fontFamily: 'Armata',
                primarySwatch: Colors.blue,
              ),
              home: const HomePage(),
            ),
          );
        });
  }
}
