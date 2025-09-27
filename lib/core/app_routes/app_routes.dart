import 'package:get/get.dart';
import 'package:moviers/view/screen/auth_screen/login_screen/login_screen.dart';
import 'package:moviers/view/screen/auth_screen/otp_verification/otp_verification.dart';
import 'package:moviers/view/screen/auth_screen/register_screen/register_screen.dart';
import 'package:moviers/view/screen/home_screen/home_screen/home_screen.dart';
import 'package:moviers/view/screen/home_screen/top_charts_screen/top_charts_screen.dart';
import 'package:moviers/view/screen/movei_screen/movie_binding/movie_binding.dart';
import 'package:moviers/view/screen/movei_screen/movie_screen.dart';
import 'package:moviers/view/screen/movie_detailse_screen/movie_details_screen.dart';
import 'package:moviers/view/screen/onboarding/onboarding.dart';
import 'package:moviers/view/screen/onboarding/onboarding_pages/onboarding_one.dart';
import 'package:moviers/view/screen/onboarding/onboarding_pages/onboarding_two.dart';
import 'package:moviers/view/screen/personalization_screen/personalization_screen.dart';
import 'package:moviers/view/screen/splash_screen/splash_screen.dart';

class AppRoutes {
  //<========== Splash Screen ==========>
  static const String splashScreen = "/splashScreen";

  //<========== Onboarding Screen ==========>
  static const String onBoardingOne = "/onBoardingOne";
  static const String onBoardingTwo = "/onBoardingTwo";
  static const String onBoarding = "/onboarding";

  //<========== Auth Screen ==========>
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String otpVerification = "/otpVerificationScreen";

  //<========== Personalization Screen ==========>
  static const String personalizationScreen = "/personalizationScreen";

  //<========== Home Screen ==========>
  static const String homeScreen = "/homeScreen";
  static const String topChartsScreen = "/topChartsScreen";

  //<========== Movie Player Screen ==========>
  static const String movieScreen = "/movieScreen";

  //<========== Movie Details  Screen ==========>
  static const String movieDetailsScreen = "/MovieDeatailsScreen";

  static List<GetPage> pages = [
    //<========== Splash Screen ==========>
    GetPage(name: splashScreen, page: () => SplashScreen()),

    //<========== Onboarding Screen ==========>
    GetPage(name: onBoardingOne, page: () => OnboardingOne()),
    GetPage(name: onBoardingTwo, page: () => OnboardingTwo()),
    GetPage(name: onBoarding, page: () => Onboarding()),

    //<========== Auth Screen ==========>
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: registerScreen, page: () => RegisterScreen()),
    GetPage(name: otpVerification, page: () => OtpVerification()),

    //<========== Personalization Screen ==========>
    GetPage(name: personalizationScreen, page: () => PersonalizationScreen()),

    //<========== Home Screen ==========>
    GetPage(name: homeScreen, page: () => Home()),
    GetPage(name: topChartsScreen, page: () => TopChartsScreen()),

    //<========== Movie Player Screen ==========>
    GetPage(
      name: movieScreen,
      page: () => MovieScreen(),
      binding: MovieBinding(),
    ),

    //<========== Movie Details  Screen ==========>
    GetPage(name: movieDetailsScreen, page: () => MovieDetailsScreen()),
  ];
}
