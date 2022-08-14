import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:metrobusnerede/alarm_list.dart';
import 'package:metrobusnerede/bloc/left_list/left_list_bloc.dart';
import 'package:metrobusnerede/constant/color.dart';
import 'package:metrobusnerede/locator.dart';

import '../bloc/current_stop/current_stop_bloc.dart';
import '../bloc/distance_alarm_stop/distance_alarm_stop_bloc.dart';
import '../bloc/distance_next_stop/distance_next_stop_bloc.dart';
import '../bloc/livelocation/livelocation_bloc.dart';
import '../bloc/next_stop/next_stop_bloc.dart';
import '../constant/constant.dart';
import '../cubit/alarm_name_cubit/alarm_name_cubit.dart';
import '../cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import '../repository/repository.dart';

class HomepageRight extends StatelessWidget {
  const HomepageRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationRepository = locator.get<LocationRepository>();
    return BlocBuilder<LivelocationBloc, LivelocationState>(
      builder: (context, currentlocation) {
        if (currentlocation is LivelocationLoading) {
          return Scaffold(
              backgroundColor: backgroundColor,
              body: CircularProgressIndicator());
        } else if (currentlocation is LivelocationLoaded) {
          context.watch<CurrentStopBloc>().add(UpdateCurrentStopEvent(
                position: currentlocation.position,
              ));
          context.watch<NextStopBloc>().add(UpdateNextStopEvent(
              position: currentlocation.position,
              way: context.watch<WayCounterBlocCubit>().state.way));
          context.watch<DistanceNextStopBloc>().add(UpdateDistanceNextStopEvent(
              nextStopName: context.watch<NextStopBloc>().state.nextStop,
              position: currentlocation.position,
              way: context.watch<WayCounterBlocCubit>().state.way));
          context.watch<LeftListBloc>().add(UpdateLeftListEvent(
              nextStopName: context.watch<NextStopBloc>().state.nextStop,
              way: context.watch<WayCounterBlocCubit>().state.way));
          context.watch<DistanceAlarmStopBloc>().add(
              UpdateDistanceAlarmStopEvent(
                  alarmStopName:
                      context.watch<AlarmNameCubit>().state.alarmname,
                  position: currentlocation.position,
                  context: context));

          try {
            return Container(
              color: backgroundColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/logo.png",
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                    child: BlocBuilder<CurrentStopBloc, CurrentStopState>(
                      builder: (context, currentEvent) {
                        return Column(
                          children: [
                            currentEvent.nextStop == "ilerliyor"
                                ? Column(
                                    children: [
                                      FittedBox(
                                          fit: BoxFit.fill,
                                          child: Lottie.asset(
                                            'assets/otobus.json',
                                            width: 100,
                                            height: 100,
                                          )),
                                      Text(
                                        "Durağa İlerliyorsunuz..",
                                        style: Constant.busStopTitleStyle,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 15),
                                        child: Text(
                                          "şu an.",
                                          style: Constant.busStopTitleStyle,
                                        ),
                                      ),
                                      Text(
                                        currentEvent.nextStop,
                                        style: Constant.ledTextGreenStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Durağındasınız.",
                                          style: Constant.busStopTitleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Sonraki Durak",
                      style: Constant.busStopTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BlocBuilder<NextStopBloc, NextStopState>(
                      builder: (context, nextStopState) {
                        return Text(
                          nextStopState.nextStop.toString(),
                          style: Constant.ledTextStyle,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Kalan Mesafe",
                      style: Constant.busStopTitleStyle,
                    ),
                  ),
                  BlocBuilder<DistanceNextStopBloc, DistanceNextStopState>(
                    builder: (context, distancestate) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          distancestate.nextStop.toString(),
                          style: Constant.ledTextStyle,
                        ),
                      );
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Seçtiğiniz Durak",
                      style: Constant.busStopTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<AlarmNameCubit, AlarmNameState>(
                      builder: (context, state) {
                        return Center(
                          child: Text(
                            state.alarmname,
                            style: Constant.ledTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: Constant.buttonStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AlarmList()));
                    },
                    child: const Text(
                      'Durak Seç',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Hız",
                      style: Constant.busStopTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      currentlocation.position.speed!.toInt().toString(),
                      style: Constant.ledTextStyle,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Durağa Kalan Mesafe",
                      style: Constant.busStopTitleStyle,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<DistanceAlarmStopBloc,
                          DistanceAlarmStopState>(
                        builder: (context, state) {
                          return Text(
                            state.nextStop.toInt().toString(),
                            style: Constant.ledTextStyle,
                          );
                        },
                      )),
                ],
              ),
            );
          } catch (e) {
            return const Text("Yüklenemiyor.");
          }
        } else {
          return const Text("Yüklenemiyor.");
        }
      },
    );
  }
}
