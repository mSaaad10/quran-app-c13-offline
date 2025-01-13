import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';

import '../../../../../core/resources/app_styles.dart';
import '../../../../../core/resources/assets_manager.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.backgroundRadio),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
            child: Column(
              children: [
                Center(child: Image.asset(AssetImages.islamiLogo)),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: ColorsManager.black,
                    unselectedLabelColor: ColorsManager.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: ColorsManager.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    tabs: const [
                      Tab(text: 'Radio'),
                      Tab(text: 'Reciters'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return itemRadio(AssetImages.soundWave);
                          }),
                      ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return itemRadio(AssetImages.mosque);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget itemRadio() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  //     padding: const EdgeInsets.all(15),
  //     height: 133,
  //     decoration: BoxDecoration(
  //         image: const DecorationImage(image: AssetImage(AssetImages.mosque)),
  //         borderRadius: BorderRadius.circular(15),
  //         color: ColorsManager.gold),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Radio',
  //           style: AppStyles.whiteSugarBold16.copyWith(
  //             fontSize: 20,
  //             color: ColorsManager.black,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 25,
  //         ),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SvgPicture.asset(SvgAssets.play,width: 24,height: 24,),
  //             const SizedBox(
  //               width: 15,
  //             ),
  //             SvgPicture.asset(SvgAssets.pause,width: 24,height: 24,),
  //
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget itemRadio(String assetImageBg) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 133,
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(assetImageBg,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text(
                'Radio',
                style: AppStyles.whiteSugarBold16.copyWith(
                  fontSize: 20,
                  color: ColorsManager.black,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SvgPicture.asset(SvgAssets.play, width: 24, height: 24, ),
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(SvgAssets.volumeHigh, width: 24, height: 24),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}

