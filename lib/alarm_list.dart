import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metrobusnerede/constant/color.dart';
import 'package:metrobusnerede/repository/repository.dart';
import 'constant/constant.dart';
import 'cubit/alarm_name_cubit/alarm_name_cubit.dart';
import 'cubit/list_cubit.dart';
import 'locator.dart';
import 'models/bus_stop.dart';

class AlarmList extends StatelessWidget {
  const AlarmList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('firsttime');
    final locationRepository = locator.get<LocationRepository>();
    return Scaffold(
      appBar: locationRepository.appbarAlarmWidget(locationRepository, context),
      body: SafeArea(
        child: BlocBuilder<ListCubit, List<busStop>>(
          builder: (context, state) {
            return SafeArea(
              child: Container(
                color: backgroundColor,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lütfen Durak Seçiniz.",
                      style: Constant.busStopTitleStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: state.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              context.read<AlarmNameCubit>().setAlarm(index);
                              Navigator.pop(context);
                              box.put("firsttime", true);
                            },
                            leading: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFe0f2f1)),
                                child: Center(
                                    child: Text(
                                  state[index].busstopid.toString(),
                                  style: Constant.busStopTitleRedStyle,
                                )),
                              ),
                            ),
                            title: Text(
                              state[index].name,
                              style: Constant.busStopTitleStyle,
                            ),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 1,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
