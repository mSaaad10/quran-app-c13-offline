import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c13_offline/core/resources/app_styles.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';
import 'package:islami_c13_offline/model/hadith.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadith> ahadithList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetImages.hadithMainBackground),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(flex: 1, child: Image.asset(AssetImages.islamiLogo)),
          Expanded(
            flex: 4,
            child: CarouselSlider.builder(
              itemCount: ahadithList.length,
              itemBuilder: (context, index, realIndex) {
                return buildHadithWidget(index);
              },
              options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  height: double.infinity),
            ),
          )
        ],
      ),
    );
  }

  buildHadithWidget(int index) {
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetImages.hadithCardBg)),
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: ahadithList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AssetImages.islamicShapeLeft,
                            color: ColorsManager.black,
                          ),
                    Image.asset(
                      AssetImages.islamicShapeRight,
                      color: ColorsManager.black,
                    ),
                  ],
                ),
                Text(
                  ahadithList[index].title,
                  style: AppStyles.blackBold24,
                )
              ],
            ),
            Expanded(
                child: Text(
              ahadithList[index].content,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ));
  }

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadith/ahadeth.txt');

    List<String> ahadith =
        fileContent.trim().split('#'); // this list contains 50 hadith object
    for (int i = 0; i < ahadith.length; i++) {
      String singleHadithItem = ahadith[i];
      List<String> singleHadithItemLines = singleHadithItem.trim().split('\n');
      String title = singleHadithItemLines[0];
      singleHadithItemLines.removeAt(0);
      String content = singleHadithItemLines.join();
      Hadith hadith = Hadith(title: title, content: content);
      ahadithList.add(hadith);
    }
    setState(() {});
  }
}
