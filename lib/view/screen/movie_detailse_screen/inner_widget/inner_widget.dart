//Trailer Design
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class TrailerDesign extends StatelessWidget {
  final String movieTrailer;
  const TrailerDesign({super.key, required this.movieTrailer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 327.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.baseBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Trailer text
            SizedBox(height: 24.h),
            CustomeText(text: AppString.trailer),

            //Trailer Card
            SizedBox(height: 10.h),
            TrailerCard(image: movieTrailer),
          ],
        ),
      ),
    );
  }
}

//Trailer Card
class TrailerCard extends StatelessWidget {
  final String image;
  const TrailerCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 327.w,
            height: 183.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                //movie thumnail
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.pause),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
