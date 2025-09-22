import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';
import 'package:moviers/view/widget/movei_information/movie_shorts_information.dart';

class TopChartCardV2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final String year;
  final String lenght;
  const TopChartCardV2({super.key,required this.imagePath,required this.lenght,required this.rating,required this.title,required this.year});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 158.w,
      height: 295.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //image here
          Container(
            width: 158.w,
            height: 237.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(4)),
            
          ),

          // title here
          SizedBox(height: 6),
          Row(
            children: [
              CustomeText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),

          //information here
          SizedBox(height: 6),
          Row(
            children: [
              MovieShortsInformation(
                gap: 12,
                rating: rating,
                year: year,
                genre: "",
                videoLength: lenght,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
