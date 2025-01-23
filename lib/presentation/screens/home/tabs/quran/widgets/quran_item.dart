import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c13_offline/core/prefs_handler/prefs_handler.dart';
import 'package:islami_c13_offline/core/resources/app_styles.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/routes_manager/routes_manager.dart';
import 'package:islami_c13_offline/model/sura.dart';
import 'package:islami_c13_offline/model/sura_details_arguments.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/quran/widgets/most_recent_item.dart';

class QuranItem extends StatelessWidget {
  const QuranItem(
      {super.key, required this.sura, required this.mostRecentSurasKey});

  final Sura sura;
  final GlobalKey<MostRecentSurasWidgetState> mostRecentSurasKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsHandler.addSuraIndex(sura.suraIndex); //
        String suraNameEn = sura.nameEn;
        String suraNameAr = sura.snameAr;
        String fileName = sura.fileName;
        Navigator.pushNamed(context, RoutesManager.suraDetails,
            arguments: SuraDetailsArguments(
                nameEn: suraNameEn,
                nameAr: suraNameAr,
                fileName: fileName,
                mostRecentSurasKey: mostRecentSurasKey));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(SvgAssets.islamicBg),
              Text('${sura.suraIndex + 1}', style: AppStyles.whiteBold12)
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.nameEn, style: AppStyles.whiteBold20),
                Text('${sura.numberOfVerses} verses',
                    style: AppStyles.whiteBold14),
              ],
            ),
          ),
          Text(sura.snameAr, style: AppStyles.whiteBold20),
        ],
      ),
    );
  }
}

class SuraDM {
  String suraNameEn;
  String suraNameAr;
  String versesNumber;
  int index;

  SuraDM(
      {required this.suraNameEn,
      required this.suraNameAr,
      required this.versesNumber,
      required this.index});
}
