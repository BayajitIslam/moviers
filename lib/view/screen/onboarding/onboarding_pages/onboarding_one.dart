import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/widget/custome_indicator/custome_indicator.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            //Photos Slide
            SizedBox(height: 146.h),
            SizedBox(
              width: 322.w,
              height: 186.h,
              child: Image.asset(AppImage.slideOnBoardingOne),
            ),
            //Title
            SizedBox(height: 80.h),
            CustomeText(
              text: AppString.onbOneTitle,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
            ),

            //Desc
            SizedBox(height: 12.h),
            CustomeText(
              text: AppString.onbOneSubTitle,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.neutral60,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),

            //indicator
            SizedBox(height: 80.h),
            CustomeIndicator(index: 0),
          ],
        ),
      ),
    );
  }
}
