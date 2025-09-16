import 'package:get/get.dart';
import 'package:moviers/view/screen/onboarding/onboarding.dart';
import 'package:moviers/view/screen/onboarding/onboarding_pages/onboarding_one.dart';
import 'package:moviers/view/screen/onboarding/onboarding_pages/onboarding_two.dart';
import 'package:moviers/view/screen/splash_screen/splash_screen.dart';

class AppRoutes {
  //<========== Splash Screen ==========>
  static const String splashScreen = "/splashScreen";

  //<========== Onboarding Screen ==========>
  static const String onBoardingOne = "/onBoardingOne";
  static const String onBoardingTwo = "/onBoardingTwo";
  static const String onBoarding = "/onboarding";

  static List<GetPage> pages = [
    //<========== Splash Screen ==========>
    GetPage(name: splashScreen, page: () => SplashScreen()),

    //<========== Onboarding Screen ==========>
    GetPage(name: onBoardingOne, page: () => OnboardingOne()),
    GetPage(name: onBoardingTwo, page: () => OnboardingTwo()),
    GetPage(name: onBoarding, page: () => Onboarding()),
  ];
}
