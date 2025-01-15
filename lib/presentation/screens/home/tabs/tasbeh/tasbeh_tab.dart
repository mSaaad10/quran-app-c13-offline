import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/model/tasbeh.dart';
import '../../../../../core/resources/app_styles.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  List<Tasbeh> tasbehList = Tasbeh.getTasbehList();
  int countTasbehNumber = 0;
  int tasbehIndex = 0;
  double currentRotation = 0.0;

  void countTasbeh() {
    setState(() {
      countTasbehNumber++;
      currentRotation += pi / 6;

      if (countTasbehNumber == 30) {
        tasbehIndex++;
        countTasbehNumber = 0;
      }
      if (tasbehIndex >= tasbehList.length) {
        tasbehIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.tasbehBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
            child: Column(
              children: [
                Center(child: Image.asset(AssetImages.islamiLogo)),
                Text(
                  'سبح اسم ربك الاعلى',
                  style: AppStyles.whiteSugarBold16.copyWith(fontSize: 36),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: currentRotation,
                      child: Image.asset(
                        AssetImages.sebhaBody,
                        width: 400,
                        height: 400,
                      ),
                    ),
                    InkWell(
                      onTap: countTasbeh,
                      child: Column(
                        children: [
                          Text(
                            tasbehList[tasbehIndex].tasbehName,
                            style: AppStyles.whiteSugarBold16.copyWith(fontSize: 36),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$countTasbehNumber',
                            style: AppStyles.whiteSugarBold16.copyWith(fontSize: 36),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
