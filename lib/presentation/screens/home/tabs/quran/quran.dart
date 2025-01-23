import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c13_offline/core/resources/app_constant.dart';
import 'package:islami_c13_offline/core/resources/app_styles.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/quran/widgets/most_recent_item.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/quran/widgets/quran_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String userText = '';
  GlobalKey<MostRecentSurasWidgetState> mostRecentSurasKey =
      GlobalKey<MostRecentSurasWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetImages.mainBackground,
              ),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.asset(AssetImages.islamiLogo),
          buildSearchField(),
          const SizedBox(
            height: 20,
          ),
          MostRecentSurasWidget(
            key: mostRecentSurasKey,
          ),
          const Text(
            'Suras list',
            style: AppStyles.whiteSugarBold16,
          ),
          buildQuranList(),
        ]),
      ),
    );
  }

  buildQuranList() {
    var filteredSuras = AppConstant.suras
        .where(
          (sura) =>
              sura.nameEn.toLowerCase().contains(userText.toLowerCase()) ||
              sura.snameAr.contains(userText),
        )
        .toList();
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: filteredSuras.length,
        itemBuilder: (context, index) {
          return QuranItem(
            mostRecentSurasKey: mostRecentSurasKey,
            sura: filteredSuras[index],
          );
        },
        separatorBuilder: (context, index) => const Divider(
              color: ColorsManager.white,
              endIndent: 30,
              indent: 30,
              height: 30,
            ));
  }

  Widget buildSearchField() {
    return TextField(
      onChanged: (input) {
        userText = input;
        setState(() {});
      },
      cursorColor: ColorsManager.white,
      style: const TextStyle(color: ColorsManager.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Container(
            padding: EdgeInsets.all(14),
            child: SvgPicture.asset(SvgAssets.quranSearchIcon)),
        hintText: 'Sura name',
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsManager.whiteSugar),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorsManager.gold, width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorsManager.gold, width: 1)),
      ),
    );
  }
}
