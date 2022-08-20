import 'dart:io';

class AdMobService {
  static String? get BannerAdUnitID{
    if(Platform.isAndroid){
        return "'ca-app-pub-3940256099942544/6300978111'"
        
    }
    else if(Platform.isIOS){
      return "ca-app-pub-3940256099942544/2934735716",
    }
  }
  
}