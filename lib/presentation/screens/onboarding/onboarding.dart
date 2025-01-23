import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_c13_offline/core/resources/app_styles.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';
import 'package:islami_c13_offline/core/routes_manager/routes_manager.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  TextStyle bodyStyle = TextStyle(fontSize: 19.0);

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      assetName,
      width: width,
      height: 200,
    );
  }

  PageDecoration pageDecoration = PageDecoration(
    imageFlex: 2,
    titleTextStyle: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: ColorsManager.gold),
    bodyTextStyle: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: ColorsManager.gold),
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: ColorsManager.blackAcc,
    imagePadding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: ColorsManager.blackAcc,
      allowImplicitScrolling: false,
      //autoScrollDuration: 3000,
      infiniteAutoScroll: false,
      dotsFlex: 2,

      showDoneButton: true,

      dotsDecorator: DotsDecorator(
          color: Colors.grey,
          activeColor: ColorsManager.gold,
          activeSize: Size(18, 7),
          size: Size(7, 7),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),

      done: Text(
        'Finish',
        style: AppStyles.goldBold16,
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      },
      globalHeader: SafeArea(
          child: Image.asset(
        AssetImages.islamiLogo,
        height: 100,
      )),

      showNextButton: true,
      next: const Text(
        'Next',
        style: AppStyles.goldBold16,
      ),
      // showBackButton: true,
      // back: const Text(
      //   'Back',
      //   style: AppStyles.goldBold16,
      // ),
      showSkipButton: true,
      onSkip: () {},
      skip: Text('Skip'),
      pages: [
        PageViewModel(
          title: "Welcome To Islami App",
          body: "",
          image: _buildImage(AssetImages.onboarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AssetImages.onboarding2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous.",
          image: _buildImage(AssetImages.onboarding3),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
            image: _buildImage(AssetImages.onboarding4),
            decoration: pageDecoration),
        PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can listen to the Holy Quran Radio through the application for free and easily",
            image: _buildImage(AssetImages.onboarding5),
            decoration: pageDecoration),
      ],
    );
  }
}
