import 'package:flutter/material.dart';
import 'package:islami_c13_offline/core/prefs_handler/prefs_handler.dart';
import 'package:islami_c13_offline/core/resources/app_styles.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';
import 'package:islami_c13_offline/model/sura.dart';

class MostRecentSurasWidget extends StatefulWidget {
  const MostRecentSurasWidget({super.key});

  @override
  State<MostRecentSurasWidget> createState() => MostRecentSurasWidgetState();
}

class MostRecentSurasWidgetState extends State<MostRecentSurasWidget> {
  List<Sura> mostRecentSuras = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMostRecentSuras(); //
  }

  void getMostRecentSuras() async {
    mostRecentSuras = await PrefsHandler.getMostRecentSuras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return mostRecentSuras.isEmpty
        ? Container()
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            //width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Most Recently',
                  style: AppStyles.whiteSugarBold16,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          mostRecentSuraWidget(mostRecentSuras[index]),
                      itemCount: mostRecentSuras.length),
                )
              ],
            ),
          );
  }

  Widget mostRecentSuraWidget(Sura sura) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.gold,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Expanded(
                  child: Text(
                sura.nameEn,
                style: AppStyles.blackAcc700,
              )),
              Expanded(
                  child: Text(
                sura.snameAr,
                style: AppStyles.blackAcc700,
              )),
              Expanded(
                  child: Text(
                '${sura.numberOfVerses} verses',
                style: AppStyles.blackAcc700,
              )),
            ],
          ),
          Image.asset(AssetImages.mostRecentImage)
        ],
      ),
    );
  }
}
