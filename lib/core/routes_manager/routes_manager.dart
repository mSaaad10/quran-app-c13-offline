import 'package:flutter/cupertino.dart';
import 'package:islami_c13_offline/presentation/screens/home/home.dart';
import 'package:islami_c13_offline/presentation/screens/onboarding/onboarding.dart';
import 'package:islami_c13_offline/presentation/screens/splash/splash.dart';
import 'package:islami_c13_offline/presentation/screens/sura_details_screen/sura_details_screen.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String suraDetails = '/suraDetails';
  static const String onboarding = '/onboarding';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const Splash(),
    home: (_) => const Home(),
    suraDetails: (_) => const SuraDetailsScreen(),
    onboarding: (_) => Onboarding(),
  };
}
