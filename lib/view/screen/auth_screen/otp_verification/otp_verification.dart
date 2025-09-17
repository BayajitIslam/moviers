import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/widget/custome_button/custome_button.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});

  // email arguments
  final email = Get.arguments;

  // otp Controller
  final TextEditingController otpController = TextEditingController();

  //otp
  final otp = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      appBar: AppBar(
        backgroundColor: AppColors.neutral100,
        actionsPadding: EdgeInsets.only(right: 15.4),
        foregroundColor: AppColors.primaryText,
        centerTitle: true,

        //<========== Appbar Title  ==========>
        title: CustomeText(
          text: AppString.otpVerification,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          //<========== Skip Button ==========>
          TextButton(
            onPressed: () {
              //<========== Skip Routing ==========>
              Get.toNamed(AppRoutes.homeScreen);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomeText(
                  text: AppString.codeIsSent,
                  color: AppColors.borderSide,
                  fontSize: 14,
                ),
                CustomeText(text: email, color: AppColors.neutral60),
              ],
            ),

            //code fillup
            SizedBox(height: 24.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(6),
                fieldHeight: 48.h,
                fieldWidth: 48.w,
                inactiveColor: AppColors.borderSide,
                inactiveFillColor: Colors.transparent,
                activeColor: AppColors.borderSide,
                selectedColor: AppColors.brand,
                activeFillColor: Colors.transparent,
                selectedFillColor: Colors.transparent,
              ),
              textStyle: const TextStyle(
                color: AppColors.primaryText,
                fontSize: 20,
              ),
              enableActiveFill: false,
              onChanged: (value) => otp.value = value,
            ),

            //privacy and terms of use
            SizedBox(height: 40.h),
            CustomeText(
              text: AppString.aggreeTerm,
              color: AppColors.neutral60,
              fontSize: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //privacy policy button
                InkWell(
                  onTap: () {
                    //privacy policy pages route here
                  },
                  child: CustomeText(
                    text: AppString.privacyPolicy,
                    fontSize: 14,
                    color: AppColors.primaryFull,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                //and text
                CustomeText(
                  text: AppString.and,
                  color: AppColors.neutral60,
                  fontSize: 14,
                ),
                //terms and use button
                InkWell(
                  onTap: () {
                    //terms of use pages route here
                  },
                  child: CustomeText(
                    text: AppString.termsOfUse,
                    fontSize: 14,
                    color: AppColors.primaryFull,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            //verify button
            Spacer(),
            Obx(
              () => CustomeButton(
                width: double.infinity,
                height: 48,
                buttonName: AppString.verify,
                bgColor: otp.value.length == 4
                    ? AppColors.brand
                    : AppColors.buttonBg,
                textColor: otp.value.length == 4
                    ? AppColors.primaryText
                    : AppColors.neutral70,
                onTap: () {
                  otp.value.length == 4
                      ? Get.toNamed(AppRoutes.homeScreen)
                      : null;
                },
              ),
            ),
            //
            SizedBox(height: 41.h),
          ],
        ),
      ),
    );
  }
}
