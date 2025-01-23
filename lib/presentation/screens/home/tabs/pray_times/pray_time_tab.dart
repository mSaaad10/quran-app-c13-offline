import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/model/pray_time.dart';
import '../../../../../core/resources/app_styles.dart';
import '../../../../../core/resources/colors_manager.dart';

class PrayTimesTab extends StatefulWidget {
  const PrayTimesTab({super.key});

  @override
  State<PrayTimesTab> createState() => _PrayTimesTabState();
}

class _PrayTimesTabState extends State<PrayTimesTab> {
  List<PrayTime> prayList = PrayTime.getParyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.BackgroundPrayTime),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
            child: Column(
              children: [
                Center(child: Image.asset(AssetImages.islamiLogo)),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: ColorsManager.gold2,
                      image: const DecorationImage(
                        image: AssetImage(AssetImages.backgroundPrayTimeCard),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 26, right: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '16 Jul,\n 2024',
                              style: AppStyles.whiteSugarBold16,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Pray Time',
                                  style: AppStyles.blackAcc700.copyWith(
                                      fontSize: 20,
                                      color: ColorsManager.black60),
                                ),
                                Text(
                                  'Tuseday',
                                  style: AppStyles.blackAcc700
                                      .copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                            const Text(
                              '09 Muh,\n 1446',
                              style: AppStyles.whiteSugarBold16,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: prayList.length,

                          itemBuilder: (context, index, realIdx) {
                            return Container(
                              width: 104,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      ColorsManager.blackAcc,
                                      ColorsManager.gold3
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:     Center(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '',

                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${prayList[index].prayName}\n',
                                          style: AppStyles.white700,
                                        ),
                                        TextSpan(
                                          text:'${prayList[index].prayTimeNumber}\n',
                                          style: AppStyles.whiteBold32,
                                        ),
                                        TextSpan(
                                          text: prayList[index].prayTime,
                                          style: AppStyles.white700,
                                        )

                                      ],
                                    ),
                                  ),
                                ),

                              );
                          },
                          options: CarouselOptions(
                            height: 128,
                            enlargeCenterPage: true,
                            viewportFraction: 0.35,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 2,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Next Pray',
                                style: AppStyles.blackAcc700.copyWith(
                                    fontSize: 20, color: ColorsManager.black60),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '- 02:32',
                                    style: AppStyles.blackAcc700
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            SvgPicture.asset(
                              SvgAssets.mute,
                            ),
                            const SizedBox(
                              width: 24,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical:20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Azkar', style: AppStyles.whiteSugarBold16,)),
                ),
                Row(
                  children: [
                    azkarCard(azkarImage: AssetImages.mosqueLeft, azkarTime: 'Evening Azkar'),
                    const SizedBox(width: 15,),
                   azkarCard(azkarImage: AssetImages.mosqueRight,azkarTime: 'Morning Azkar'),
                  ],
                )


              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget azkarCard ({String? azkarTime, String? azkarImage }){
    return   Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorsManager.gold,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(azkarImage ??'',height: 158, ),

            Text(
              azkarTime ??'',
              style:AppStyles.white700.copyWith(fontSize: 20), // Text color
            ),
          ],
        ),
      ),
    );
  }
}
