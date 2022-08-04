import 'package:flutter/Material.dart';
import 'busstop_list.dart';

class HomepageLeft extends StatelessWidget {
  const HomepageLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("left");
    return busstop_list();
  }
}
