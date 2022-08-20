import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:metrobusnerede/locator.dart';
import 'package:metrobusnerede/notification.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constant/color.dart';
import '../../constant/constant.dart';
import '../leftside/homepage_left.dart';
import '../repository/repository.dart';
import '../rightside/homepage_right.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late BannerAd staticAd;
  late final LocalNotificationService service;
  static const AdRequest adRequest = AdRequest();
  bool staticAdLoaded = false;
  final locationRepository = locator.get<LocationRepository>();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  void loadStaticAds() {
    staticAd = BannerAd(
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              staticAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        request: adRequest);
  }
  staticAd.load();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        await Hive.openBox('firsttime');
        var box = Hive.box('firsttime');
        box.put("firsttime", true);
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationRepository = locator.get<LocationRepository>();

    Future.delayed(
        Duration.zero, () => locationRepository.showWayDialog(context));

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: Row(children: [
                Expanded(
                    flex: 3,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: Constant.borderSize,
                          ),
                        ),
                        child: const HomepageLeft())),
                Expanded(
                    flex: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: Constant.borderSize, color: borderColor),
                            right: BorderSide(
                                width: Constant.borderSize, color: borderColor),
                            top: BorderSide(
                                width: Constant.borderSize, color: borderColor),
                          ),
                        ),
                        child: const HomepageRight())),
              ]),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: locationRepository.myBanner.size.width.toDouble(),
                height: locationRepository.myBanner.size.height.toDouble(),
                child: AdWidget(
                  ad: locationRepository.myBanner,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
