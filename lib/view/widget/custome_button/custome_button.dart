import 'package:flutter/material.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class CustomeButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  final Color bgColor;
  final String icon;
  final bool isIconEnable;
  final double height;
  final double width;
  final int fontsize;
  final double redius;
  const CustomeButton({
    super.key,
    required this.buttonName,
    required this.onTap,
    this.bgColor = AppColors.brand,
    this.icon = AppImage.apple,
    this.isIconEnable = false,
    this.height = 56,
    this.fontsize = 16,
    this.redius = 8,
    this.width = 56
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(redius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeText(
              text: buttonName,
              color: AppColors.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),

            isIconEnable
                ? Image.asset(icon, height: 24, width: 24)
                : Container(),
          ],
        ),
      ),
    );
  }
}
