import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrobusnerede/constant/color.dart';

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
                "state.durakAdi,",
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
              "70 KM",
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
            child: Text(
              "100 M",
              style: Constant.ledTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
