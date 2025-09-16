import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/screen/splash_screen/splash_screen_controller/splash_screen_controller.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  //Dependecy Inject
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //<========== Logo Here ==========>
          SizedBox(height: 382.h),
          Center(child: Image.asset(AppImage.logo)),

          //<========== Verson Text Here ==========>
          Spacer(),
          CustomeText(
            text: AppString.verson,
            color: AppColors.neutral70,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 58.h),
        ],
      ),
    );
  }
}
