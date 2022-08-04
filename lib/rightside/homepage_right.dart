import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrobusnerede/constant/color.dart';

import '../bloc/livelocation/speed_bloc.dart';
import '../constant/constant.dart';

class HomepageRight extends StatelessWidget {
  HomepageRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("right");
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              "Durağındasınız.",
              style: Constant.busStopTitleStyle,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "durak",
                style: Constant.ledTextStyle,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
            child: Text(
              "Durağındasınız.",
              style: Constant.busStopTitleStyle,
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "MECIDIYEKOY",
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
              "Kalan Mesafe",
              style: Constant.busStopTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "MECIDIYEKOY",
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
              "Seçtiğiniz Durak",
              style: Constant.busStopTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "BELIRLENMEDI.",
              style: Constant.ledTextStyle,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "DURAK SEÇ",
              style: TextStyle(
                  color: backgroundColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.white),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "70",
                style: Constant.ledTextStyle,
              )),
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
            child: BlocBuilder<SpeedLocationBloc, SpeedLocationState>(
              builder: (context, state) {
                if (state is SpeedlocationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SpeedLocationLoaded) {
                  try {
                    return Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.position.toString(),
                            style: Constant.ledTextStyle),
                      ],
                    ));
                  } catch (e) {
                    return Text(e.toString());
                  }
                } else {
                  return const Text("");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
