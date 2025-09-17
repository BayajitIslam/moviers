import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/view/screen/personalization_screen/selection_controller/selection_controller.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class GenreCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final dynamic likes;
  final bool isSelected;
  final void Function()? ontap;
  GenreCard({
    super.key,
    required this.imagePath,
    required this.likes,
    required this.title,
    required this.isSelected,
    required this.ontap,
  });

  //initialize selected controller
  final SelectionController selectionController = Get.put(
    SelectionController(),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 158.w,
      height: 216.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: ontap,
                child: Container(
                  width: 158.w,
                  height: 158.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 2,
                        color: isSelected
                            ? AppColors.brand
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Image.asset(AppImage.tickSquare),
                ),
            ],
          ),
          //genre name
          SizedBox(height: 10.h),
          CustomeText(text: title, fontWeight: FontWeight.w400),
          //likes
          SizedBox(height: 6.h),
          Row(
            children: [
              //icon
              Image.asset(AppImage.twoUser),

              //text
              SizedBox(width: 6.w),
              CustomeText(
                text: "$likes like this",
                color: AppColors.neutral60,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
