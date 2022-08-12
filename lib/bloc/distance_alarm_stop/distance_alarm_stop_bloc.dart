import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:hive/hive.dart';
import 'package:metrobusnerede/location.dart';
import 'package:metrobusnerede/notofications.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';
import '../../constant/color.dart';
import '../../constant/constant.dart';
import '../../cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import '../../models/bus_stop.dart';
import '../../repository/repository.dart';
part 'distance_alarm_stop_event.dart';
part 'distance_alarm_stop_state.dart';

class DistanceAlarmStopBloc
    extends Bloc<DistanceAlarmStopEvent, DistanceAlarmStopState> {
  var box = Hive.box('firsttime');

  DistanceAlarmStopBloc()
      : super(const DistanceAlarmStopInitial(firstValue: 0)) {
    final locationRepository = LocationRepository();
    List<busStop> busStoplist = [];

    bool check = true;

    on<UpdateDistanceAlarmStopEvent>((event, emit) async {
      busStoplist = await locationRepository.busStopList();
      for (var i = 0; i < busStoplist.length; i++) {
        if (busStoplist[i].name == event.alarmStopName) {
          double alarmdistance = await calculateDistance(
              event.position.latitude,
              event.position.longitude,
              busStoplist[i].latitude,
              busStoplist[i].longitude);

          if (alarmdistance < busStoplist[i].check) {
            _showWayDialog(event.context, busStoplist[i].name);
          }

          emit(MyDistanceAlarmStopState(nextStopValue: alarmdistance.toInt()));
        }
      }
    });
  }
}

Future<double> calculateDistance(lat1, lon1, lat2, lon2) async {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 1000 * 12742 * asin(sqrt(a));
}

void _showWayDialog(BuildContext context, String name) async {
  var box2 = Hive.box('notif');
  bool notif = box2.get("notif");
  if (notif) {
    FlutterRingtonePlayer.play(
        android: AndroidSounds.alarm, ios: IosSounds.glass, looping: true);
    Vibration.vibrate(
      repeat: 0,
      pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
    );
    createAlarmNotification(name);
    showDialog(
      barrierColor: Colors.black87,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Expanded(
          child: Dialog(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: backgroundColor,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Gitmek İstediğiniz durağa vardınız..",
                    style: Constant.busStopTitleStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  const Icon(
                    Icons.warning,
                    size: 70,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    child: Text("Kapat"),
                    onPressed: () {
                      FlutterRingtonePlayer.stop();
                      Vibration.cancel();
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Ayarlardan alarm muziğini değiştirerek alarm sesini özelleştirebilirsiniz.",
                    style: Constant.busStopTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              )),
        );
      },
    );
    box2.put("notif", false);
  }
}
