import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviers/utils/app_colors.dart';

class CustomeIndicator extends StatelessWidget {
  final int index;
  const CustomeIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(3, (dotIndex) {
          return Container(
            width: 4.w,
            height: index == dotIndex ? 8.h : 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index == dotIndex
                  ? AppColors.brand
                  : AppColors.primaryText,
            ),
            margin: EdgeInsets.only(right: 4, left: 4),
          );
        }),
      ],
    );
  }
}
