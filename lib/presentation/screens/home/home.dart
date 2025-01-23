import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/pray_times/pray_time_tab.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/quran/quran.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/radio/radio.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/tasbeh/tasbeh_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> tabs = const [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    PrayTimesTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() => BottomNavigationBar(
          currentIndex: selectedIndex, // 0
          onTap: (tappedIndex) {
            selectedIndex = tappedIndex; // 1
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: buildBottomNavBarIcon(SvgAssets.selectedQuranIcon,
                    SvgAssets.quranIcon, selectedIndex == 0),
                label: 'Quran'),
            BottomNavigationBarItem(
                icon: buildBottomNavBarIcon(SvgAssets.selectedHadithIcon,
                    SvgAssets.hadithIcon, selectedIndex == 1),
                label: 'Hadith'),
            BottomNavigationBarItem(
                icon: buildBottomNavBarIcon(SvgAssets.selectedTasbehIcon,
                    SvgAssets.tasbehIcon, selectedIndex == 2),
                label: 'Tasbeh'),
            BottomNavigationBarItem(
                icon: buildBottomNavBarIcon(SvgAssets.selectedRadioIcon,
                    SvgAssets.radioIcon, selectedIndex == 3),
                label: 'Radio'),
            BottomNavigationBarItem(
                icon: buildBottomNavBarIcon(SvgAssets.selectedPrayTimesIcon,
                    SvgAssets.prayTimesIcon, selectedIndex == 4),
                label: 'Pray times'),
          ]);

  Widget buildBottomNavBarIcon(
    String selectedImagePath,
    String unSelectedImagePath,
    bool isSelected,
  ) {
    return isSelected
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
                color: ColorsManager.black60,
                borderRadius: BorderRadius.circular(66)),
            child: SvgPicture.asset(
              selectedImagePath,
              width: 19,
              height: 22,
            ))
        : SvgPicture.asset(
            unSelectedImagePath,
            width: 19,
            height: 22,
          );
  }
}
