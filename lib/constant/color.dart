import 'package:flutter/Material.dart';

import 'constant.dart';

Color backgroundColor = const Color(0xFFe94546);
Color borderColor = Colors.white;
MaterialColor materialColorWhite = const MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

var borderOnlyBottom = Border(
  bottom: BorderSide(width: Constant.borderSize, color: borderColor),
);
