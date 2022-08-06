import 'dart:async';
import 'package:location/location.dart' as loc;

import '../models/busStop.dart';

class LocationRepository {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  Future<List<busStop>> BusStopList() async {
    List<busStop> busStopList = [];
    busStopList.add(busStop(0, "B.DUZU SONDURAK", 41.022019, 28.625050, 168));
    busStopList.add(busStop(1, "BEYKENT", 41.019562, 28.630895, 154));
    busStopList.add(busStop(2, "CUMHURIYET MAH.", 41.015418, 28.641604, 158));
    busStopList.add(busStop(3, "BEYLIKDUZU BEL.", 41.012331, 28.649756, 243));
    busStopList.add(busStop(4, "BEYLIKDUZU", 41.009682, 28.656780, 157));
    busStopList.add(busStop(5, "GUZELYURT", 41.006587, 28.665286, 144));
    busStopList.add(busStop(6, "HAREMIDERE", 41.005986, 28.673169, 140));
    busStopList.add(busStop(7, "HAREMIDERE SANAYI", 41.004454, 28.684950, 170));
    busStopList.add(busStop(8, "SAADETDERE MAH.", 40.999741, 28.693115, 194));
    busStopList
        .add(busStop(9, "MUSTAFA KEMAL PASA", 40.994989, 28.706205, 184));
    busStopList
        .add(busStop(10, "CIHANGIR UNV. MAH.", 40.990726, 28.713612, 120));
    busStopList.add(busStop(11, "AVCILAR", 40.983564, 28.725990, 180));
    busStopList.add(busStop(12, "ŞUKRUBEY", 40.979978, 28.732035, 190));
    busStopList
        .add(busStop(13, "IBB SOSYAL TESISLER", 40.977975, 28.745077, 142));
    busStopList.add(busStop(14, "KUCUKCEKMECE", 40.986446, 28.769875, 125));
    busStopList.add(busStop(15, "CENNET MAH.", 40.985348, 28.782700, 160));
    busStopList.add(busStop(16, "FLORYA", 40.986746, 28.788792, 387));
    busStopList.add(busStop(17, "BESYOL", 40.994289, 28.794891, 154));
    busStopList.add(busStop(18, "SEFAKOY", 40.998590, 28.798545, 190));
    busStopList.add(busStop(19, "YENIBOSNA", 40.992332, 28.834983, 256));
    busStopList.add(busStop(20, "SIRINEVLER", 40.991722, 28.845987, 221));
    busStopList.add(busStop(21, "BAHCELIEVLER", 40.995098, 28.863594, 132));
    busStopList
        .add(busStop(22, "INCIRLI (BAKIRKOY)", 40.997814, 28.872305, 150));
    busStopList.add(busStop(23, "ZEYTINBURNU", 41.003177, 28.890433, 220));
    busStopList.add(busStop(24, "MERTER", 41.007745, 28.897581, 150));
    busStopList.add(busStop(25, "CEVIZLIBAG", 41.016617, 28.911238, 332));
    busStopList.add(busStop(26, "TOPKAPI", 41.020396, 28.917438, 150));
    busStopList.add(busStop(27, "BAYRAMPASA", 41.024167, 28.921690, 217));
    busStopList.add(busStop(28, "EDIRNEKAPI", 41.033703, 28.930116, 324));
    busStopList
        .add(busStop(29, "AYVANSARAY / EYUP", 41.038698, 28.937556, 260));
    busStopList.add(busStop(30, "HALICIOGLU", 41.048870, 28.946450, 250));
    busStopList.add(busStop(31, "OKMEYDANI", 41.056287, 28.960850, 300));
    busStopList.add(busStop(32, "DARULACEZE PERPA", 41.062485, 28.967853, 250));
    busStopList
        .add(busStop(33, "OKMEYDANI HASTANE", 41.067379, 28.975725, 200));
    busStopList.add(busStop(34, "CAGLAYAN", 41.067337, 28.980851, 180));
    busStopList.add(busStop(35, "MECIDIYEKOY", 41.066869, 28.991690, 230));
    busStopList.add(busStop(36, "ZINCIRLIKUYU", 41.066149, 29.013119, 156));
    busStopList
        .add(busStop(37, "15 TEM. SEH. KOP.", 41.036593, 29.043351, 200));
    busStopList.add(busStop(37, "BURHANİYE", 41.032020, 29.046939, 105));
    busStopList.add(busStop(38, "ALTUNIZADE", 41.021904, 29.048345, 300));
    busStopList.add(busStop(39, "ACIBADEM", 41.014534, 29.057279, 230));
    busStopList.add(busStop(40, "UZUNCAYIR", 40.998859, 29.056540, 162));
    busStopList.add(busStop(41, "FIKIRTEPE", 40.993912, 29.048362, 300));
    busStopList.add(busStop(42, "S.CESME SONDURAK", 40.991768, 29.037694, 130));
    return busStopList;
  }
}
