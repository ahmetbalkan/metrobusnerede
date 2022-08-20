import 'dart:ffi';

import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrobusnerede/constant/color.dart';

class Constant {
  Constant._();
  static const double borderSize = 1;
  static final busStopFontStyle = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    color: Colors.white,
    fontFamily: 'Armata',
  );
  static final busStopTitleStyle = TextStyle(
      fontSize: ScreenUtil().setSp(16),
      color: Colors.white,
      fontFamily: 'Armata');
  static final busStopTitleRedStyle = TextStyle(
      fontSize: ScreenUtil().setSp(20),
      color: backgroundColor,
      fontFamily: 'Armata');
  static final floatButtonText = TextStyle(
      fontSize: ScreenUtil().setSp(15),
      color: backgroundColor,
      fontFamily: 'Armata');
  static final buttonText = TextStyle(
      fontSize: ScreenUtil().setSp(25),
      color: backgroundColor,
      fontFamily: 'Armata');

  static final ledTextStyle = TextStyle(
      height: 1.3, // the height between text, default is null
      letterSpacing: 1.3,
      fontSize: ScreenUtil().setSp(18),
      color: Colors.white,
      fontFamily: 'Led');

  static final ledTextGreenStyle = TextStyle(
      fontSize: ScreenUtil().setSp(18),
      color: Colors.greenAccent,
      fontFamily: 'Led');
  static final wayDialogBlackStyle = TextStyle(
    fontSize: ScreenUtil().setSp(18),
    color: Colors.black,
    fontFamily: 'Armata',
  );
  static final wayDialogRedStyle = TextStyle(
    fontSize: ScreenUtil().setSp(18),
    color: backgroundColor,
    fontFamily: 'Armata',
  );
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    fixedSize: ,
    textStyle: const TextStyle(
        fontSize: 15, color: Colors.red, fontWeight: FontWeight.normal),
  );
}
