import 'package:flutter/material.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';

import '../../../../../core/resources/app_constant.dart';
import '../../../../../core/resources/app_styles.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int countTasbehNumber = 0;
  int tasbehIndex = 0;

  countTasbeh() {
    countTasbehNumber++;

    if (countTasbehNumber == 30) {
      tasbehIndex++;
      countTasbehNumber = 0;
      setState(() {});
    }
    if (tasbehIndex >= AppConstant.tasbehAr.length) {
      tasbehIndex = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                AssetImages.tasbehBackground,
              ),
              fit: BoxFit.cover,
            )),
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
                    Image.asset(AssetImages.sebhaBody),
                    InkWell(
                      onTap: () {
                        countTasbeh();
                      },
                      child: Column(
                        children: [
                          Text(
                            AppConstant.tasbehAr[tasbehIndex],
                            style: AppStyles.whiteSugarBold16
                                .copyWith(fontSize: 36),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '$countTasbehNumber',
                            style: AppStyles.whiteSugarBold16
                                .copyWith(fontSize: 36),
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
