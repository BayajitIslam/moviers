import 'package:flutter/material.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/screen/onboarding/onboarding_pages/onboarding_one.dart';
import 'package:moviers/view/screen/onboarding/onboarding_pages/onboarding_two.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutral100,
        actionsPadding: EdgeInsets.only(right: 15.4),
        centerTitle: true,
        //<========== Appbar Logo  ==========>
        title: Image.asset(AppImage.logo, width: 111, height: 28.2),
        actions: [
          //<========== Skip Button ==========>
          TextButton(
            onPressed: () {
              //<========== Skip Routing ==========>
            },

            child: CustomeText(
              text: AppString.skip,
              color: AppColors.neutral60,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
         OnboardingOne(),
         OnboardingTwo()
         ],
      ),
    );
  }
}
