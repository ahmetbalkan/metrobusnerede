import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get BannerAdUnitID {
    if (Platform.isAndroid) {
      return "ca-app-pub-6077588137827161/2291829999";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6077588137827161/2274135237";
    }
    return null;
  }

  static String? get intersAdUnitID {
    if (Platform.isAndroid) {
      return "ca-app-pub-6077588137827161/4726421649";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6077588137827161/4558900685";
    }
    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint("ad loaded"),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint("ad loaded failed $error");
    },
  );
}
