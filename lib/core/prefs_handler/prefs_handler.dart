import 'package:islami_c13_offline/core/resources/app_constant.dart';
import 'package:islami_c13_offline/model/sura.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHandler {
  // 10
  static void addSuraIndex(int suraIndex) async {
    // 0
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mostRecentSurasIndex =
        prefs.getStringList('most_recent_suras') ?? [];
    if (mostRecentSurasIndex.length >= 3) {
      bool isRemoved = mostRecentSurasIndex.remove(mostRecentSurasIndex.first);
      print(isRemoved);
    }
    if (mostRecentSurasIndex.contains('$suraIndex')) {
      mostRecentSurasIndex.remove('$suraIndex');
      mostRecentSurasIndex.add('$suraIndex');
    } else {
      mostRecentSurasIndex.add('$suraIndex');
    }

    prefs.setStringList("most_recent_suras", mostRecentSurasIndex);
  }

  static Future<List<Sura>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras") ?? [];
    List<Sura> mostRecentSuras = [];
// ["1", "4", "5"]
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int suraIndex = int.parse(mostRecentSurasIndex[i]); // 4
      mostRecentSuras.add(AppConstant.suras[suraIndex]);
    }


    return mostRecentSuras.reversed.toList();
  }
}
