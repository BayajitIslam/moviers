import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/widget/custome_button/custome_button.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';
import 'package:moviers/view/widget/custome_textfield/custome_textfield.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  //<========== Email Text Controller  ==========>
  final TextEditingController emailTextController = TextEditingController();

  //<========== Password Text Controller  ==========>
  final TextEditingController passwordTextController = TextEditingController();

  //<========== codnfirmpass Text Controller  ==========>
  final TextEditingController confirmPwTextController = TextEditingController();

  //<========== date and year Text Controller  ==========>
  final TextEditingController dateYearTextController = TextEditingController();
  //
  var password = ''.obs;
  var email = ''.obs;
  var confirmPw = ''.obs;
  var dateYear = ''.obs;

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
          text: AppString.register,
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
            //Register title
            SizedBox(height: 25.w),
            Row(
              children: [
                CustomeText(
                  text: AppString.createNewAccount,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),

            //email textfield
            SizedBox(height: 24.h),
            CustomeTextfield(
              onChanged: (value) => email.value = value,
              hintText: AppString.email,
              textfielController: emailTextController,
              prefixicon: Icons.email,
            ),

            //password textfield
            SizedBox(height: 16.h),
            CustomeTextfield(
              onChanged: (value) => password.value = value,
              hintText: AppString.password,
              textfielController: passwordTextController,
              prefixicon: Icons.lock,
            ),

            //confirm textfield
            SizedBox(height: 24.h),
            CustomeTextfield(
              onChanged: (value) => confirmPw.value = value,
              hintText: AppString.confitmPass,
              textfielController: confirmPwTextController,
              prefixicon: Icons.email,
            ),

            //date year textfield
            SizedBox(height: 16.h),
            CustomeTextfield(
              onChanged: (value) => dateYear.value = value,
              hintText: AppString.ddmmyyyy,
              textfielController: dateYearTextController,
              prefixicon: Icons.date_range,
            ),

            //login button
            SizedBox(height: 16),
            Obx(
              () => CustomeButton(
                width: double.infinity,
                height: 48.h,
                fontsize: 16,
                textColor:
                    password.value.isEmpty ||
                        email.value.isEmpty ||
                        dateYear.value.isEmpty ||
                        confirmPw.value.isEmpty
                    ? AppColors.neutral70
                    : AppColors.primaryText,
                bgColor:
                    password.value.isEmpty ||
                        email.value.isEmpty ||
                        dateYear.value.isEmpty ||
                        confirmPw.value.isEmpty
                    ? AppColors.buttonBg
                    : AppColors.brand,
                buttonName: AppString.createAccount,
                onTap: () {
                  //Login Button Fuction
                  password.value.isNotEmpty &&
                          email.value.isNotEmpty &&
                          confirmPw.value.isNotEmpty &&
                          dateYear.value.isNotEmpty
                      ? Get.toNamed(AppRoutes.homeScreen)
                      : null;
                },
              ),
            ),

            //or
            SizedBox(height: 16.h),
            CustomeText(
              text: AppString.or,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.neutral60,
            ),

            //apple login button
            SizedBox(height: 16.h),
            CustomeButton(
              width: double.infinity,
              height: 48.h,
              isIconEnable: true,
              icon: AppImage.apple,
              buttonName: AppString.registerApple,
              textColor: AppColors.neutral100,
              bgColor: AppColors.primaryText,
              fontsize: 16,

              onTap: () {
                //Apple Login Fuction Here
                Get.toNamed(AppRoutes.homeScreen);
              },
            ),

            //google login button
            SizedBox(height: 16.h),
            CustomeButton(
              width: double.infinity,
              height: 48.h,
              isBorderEnable: true,
              isIconEnable: true,
              icon: AppImage.google,
              buttonName: AppString.registerGoogle,
              textColor: AppColors.primaryText,
              bgColor: AppColors.neutral100,
              fontsize: 16,

              onTap: () {
                //Google Login Fuction Here
                Get.toNamed(AppRoutes.homeScreen);
              },
            ),

            //dont have an account? sign up
            Spacer(),

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
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
