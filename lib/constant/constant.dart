import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      fontSize: ScreenUtil().setSp(20), color: Colors.white, fontFamily: 'Led');
}
