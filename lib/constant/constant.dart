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

  static final ledTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(24), color: Colors.white, fontFamily: 'Led');

  static final ledTextGreenStyle = TextStyle(
      fontSize: ScreenUtil().setSp(24),
      color: Colors.greenAccent,
      fontFamily: 'Led');
  static final WayDialogBlackStyle = TextStyle(
    fontSize: ScreenUtil().setSp(18),
    color: Colors.black,
    fontFamily: 'Armata',
  );
  static final WayDialogRedStyle = TextStyle(
    fontSize: ScreenUtil().setSp(18),
    color: backgroundColor,
    fontFamily: 'Armata',
  );
}
