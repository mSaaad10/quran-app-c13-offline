import 'package:flutter/cupertino.dart';
import 'package:islami_c13_offline/presentation/screens/home/tabs/quran/widgets/most_recent_item.dart';

class SuraDetailsArguments {
  final String nameEn;
  final String nameAr;
  final String fileName;
  final GlobalKey<MostRecentSurasWidgetState> mostRecentSurasKey;

  const SuraDetailsArguments(
      {required this.nameEn,
      required this.nameAr,
      required this.fileName,
      required this.mostRecentSurasKey});
}
