import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/widget/custome_button/custome_button.dart';
import 'package:moviers/view/widget/custome_indicator/custome_indicator.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Column(
        children: [
          //<========== Video Player Image ==========>
          SizedBox(height: 121.h),
          Center(
            child: SizedBox(
              width: 322.w,
              height: 212.h,
              child: Image.asset(AppImage.videoPlayerOnbTwo),
            ),
          ),

          //Title
          SizedBox(height: 80.h),
          CustomeText(
            text: AppString.onbTwoTitle,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryText,
          ),

          //Desc
          SizedBox(height: 12.h),
          CustomeText(
            text: AppString.onbTwoSubTitle,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.neutral60,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),

          //Indicator
          SizedBox(height: 80.h),
          CustomeIndicator(index: 2),

          //button
          SizedBox(height: 45.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomeButton(
                  width: 155,
                  height: 48,
                  bgColor: AppColors.buttonBg,
                  buttonName: AppString.getStarted,
                  onTap: () {

                    //<========== Get Started Route Here ==========>
                    Get.toNamed(AppRoutes.registerScreen);
                  },
                ),
                CustomeButton(
                  width: 155,
                  height: 48,
                  buttonName: AppString.login,
                  onTap: () {

                    //<========== Login Route Here ==========>
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
