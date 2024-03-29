import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';

import 'package:metrobusnerede/alarm_list.dart';
import 'package:metrobusnerede/bloc/alarm_size_bloc/alarm_size_bloc.dart';
import 'package:metrobusnerede/bloc/left_list/left_list_bloc.dart';
import 'package:metrobusnerede/constant/color.dart';
import 'package:metrobusnerede/locator.dart';
import '../bloc/alarm_bloc/alarm_bloc.dart';
import '../bloc/current_stop/current_stop_bloc.dart';
import '../bloc/distance_alarm_stop/distance_alarm_stop_bloc.dart';
import '../bloc/distance_next_stop/distance_next_stop_bloc.dart';
import '../bloc/livelocation/livelocation_bloc.dart';
import '../bloc/next_stop/next_stop_bloc.dart';
import '../constant/constant.dart';
import '../cubit/alarm_name_cubit/alarm_name_cubit.dart';
import '../cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import '../notification.dart';
import '../repository/repository.dart';

class HomepageRight extends StatefulWidget {
  const HomepageRight({Key? key}) : super(key: key);

  @override
  State<HomepageRight> createState() => _HomepageRightState();
}

class _HomepageRightState extends State<HomepageRight> {
  late final LocalNotificationService service;
  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationRepository = locator.get<LocationRepository>();
    final notification = locator.get<LocalNotificationService>();
    return BlocBuilder<LivelocationBloc, LivelocationState>(
      builder: (context, currentlocation) {
        if (currentlocation is LivelocationLoading) {
          return Scaffold(
              backgroundColor: backgroundColor,
              body: const Center(child: CircularProgressIndicator()));
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
          context.watch<AlarmBloc>().add(LoadAlarmEvent(
              alarm: context.watch<AlarmNameCubit>().state.alarmname));
          context.watch<DistanceAlarmStopBloc>().add(
              UpdateDistanceAlarmStopEvent(
                  alarmStopName:
                      context.watch<AlarmNameCubit>().state.alarmname,
                  position: currentlocation.position,
                  context: context));
          context.watch<AlarmSizeBloc>().add(UpdateAlarmSizeEvent(
              alarmid: context.watch<AlarmNameCubit>().state.alarmid,
              nextStop: context.watch<NextStopBloc>().state.nextStopid,
              way: context.watch<WayCounterBlocCubit>().state.way));

          try {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Image.asset(
                              alignment: Alignment.centerLeft,
                              "assets/logo.png",
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        locationRepository.showWayDialog(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.change_circle,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            "changeway".tr,
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
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
                                    Lottie.asset(
                                      'assets/otobus.json',
                                      width: 300,
                                      height: 100,
                                    ),
                                    Text(
                                      "ontheway".tr,
                                      style: Constant.busStopTitleStyle,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 10),
                                      child: Text(
                                        "now".tr,
                                        style: Constant.busStopTitleStyle,
                                      ),
                                    ),
                                    Text(
                                      currentEvent.nextStop,
                                      style: Constant.ledTextGreenStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "duragindasiniz".tr,
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
                    "nextstation".tr,
                    style: Constant.busStopTitleStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "distancenextstop".tr,
                            style: Constant.busStopTitleStyle,
                          ),
                        ),
                        BlocBuilder<DistanceNextStopBloc,
                            DistanceNextStopState>(
                          builder: (context, distancestate) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                distancestate.nextStop.toString(),
                                style: Constant.ledTextStyle,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      width: 1,
                      height: 60,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "speed".tr,
                            style: Constant.busStopTitleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            (currentlocation.speed.toInt().toString()),
                            style: Constant.ledTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    "yourchosenstop".tr,
                    style: Constant.busStopTitleStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
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
                  child: Text(
                    'selectbusstop'.tr,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                Text(
                  "alarmoptions".tr,
                  style: Constant.busStopTitleStyle,
                ),
                Column(
                  children: [
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "distancenextstop".tr,
                              style: Constant.busStopTitleStyle,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocBuilder<DistanceAlarmStopBloc,
                                    DistanceAlarmStopState>(
                                  builder: (context, state) {
                                    return Text(
                                      state.alarmDistance.toInt().toString(),
                                      style: Constant.ledTextStyle,
                                    );
                                  },
                                )),
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          width: 1,
                          height: 60,
                        ),
                        Column(
                          children: [
                            Text(
                              "remainingstop".tr,
                              style: Constant.busStopTitleStyle,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    BlocBuilder<AlarmSizeBloc, AlarmSizeState>(
                                  builder: (context, state) {
                                    return Text(
                                      state.alarmSize == 78
                                          ? "wrongway".tr
                                          : state.alarmSize.toString(),
                                      style: Constant.ledTextStyle,
                                    );
                                  },
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1.0,
                ),
              ],
            );
          } catch (e) {
            return Text("cannotload".tr);
          }
        } else if (currentlocation is LivelocationError) {
          return Text("couldnotopen".tr);
        } else {
          return Text("cannotload".tr);
        }
      },
    );
  }
}
