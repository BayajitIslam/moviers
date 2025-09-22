import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class MovieShortsInformation extends StatelessWidget {
  final double rating;
  final String year;
  final String videoLength;
  final String genre;
  final double gap;
  const MovieShortsInformation({
    super.key,
    required this.rating,
    required this.year,
    required this.genre,
    required this.videoLength,
    required this.gap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //reviw
        Icon(Icons.star, color: AppColors.icon),
        SizedBox(width: 6.w),
        CustomeText(text: "$rating", color: AppColors.icon),

        //release date
        SizedBox(width: gap.w),
        CustomeText(
          text: year,
          color: AppColors.neutral60,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        //movie length
        SizedBox(width: gap.w),
        CustomeText(
          text: videoLength,
          color: AppColors.neutral60,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        //genre
        SizedBox(width: gap.w),
        CustomeText(
          text: genre,
          color: AppColors.neutral60,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
