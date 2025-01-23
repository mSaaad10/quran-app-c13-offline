import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c13_offline/core/resources/app_styles.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';
import 'package:islami_c13_offline/model/sura_details_arguments.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = '';
  late SuraDetailsArguments arguments;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    loadQuranFile(arguments.fileName);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('_SuraDetailsScreenState is disposed');
    arguments.mostRecentSurasKey.currentState?.getMostRecentSuras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackAcc,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.gold),
        backgroundColor: ColorsManager.blackAcc,
        title: Text(
          arguments.nameEn,
          style: AppStyles.goldBold20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetImages.islamicShapeLeft),
                Text(
                  arguments.nameAr,
                  style: AppStyles.goldBold24,
                ),
                Image.asset(AssetImages.islamicShapeRight),
              ],
            ),
            Expanded(
              child: suraContent.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Center(
                        child: Text(
                          suraContent,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: AppStyles.goldBold20.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
            ),
            Image.asset(AssetImages.quranBottomImage),
          ],
        ),
      ),
    );
  }

  int add(int n1, int n2) {
    return n1 + n2;
  }

  void loadQuranFile(String fileName) async {
    String fileContent =
        await rootBundle.loadString('assets/files/quran/$fileName');
    List<String> suraLines = fileContent.trim().split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    suraContent = suraLines.join();

    print('Helllo');
    setState(() {});
  }
}
