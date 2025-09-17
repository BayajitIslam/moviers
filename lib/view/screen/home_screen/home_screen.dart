import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/screen/home_screen/inner_widget/inner_widget.dart';
import 'package:moviers/view/widget/custome_button/custome_button.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';
import 'package:moviers/view/widget/movei_information/movie_shorts_information.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 334.h,
                  child: Image.asset(AppImage.movieOne, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomeText(
                      text: "Rogue One: A Star Wars  \nStory",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(),
                    spreadRadius: 6,
                    blurRadius: 10,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    MovieShortsInformation(
                      rating: 8.4,
                      year: "2016",
                      videoLength: "1h 54m",
                      genre: "Sci-FI",
                    ),
                  ],
                ),
              ),
            ),

            //watch now and watchlist
            SizedBox(height: 24.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  //play button
                  CustomeButton(
                    width: 269.w,
                    height: 48.h,
                    isIconEnable: true,
                    icon: AppImage.play,
                    redius: 4,
                    buttonName: AppString.watchMovie,
                    onTap: () {
                      //Watch movie fuction here
                    },
                  ),

                  //watchlist button
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      //Watchlist function here
                    },
                    child: Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.buttonBg,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(AppImage.watchlist),
                    ),
                  ),
                ],
              ),
            ),

            //top charts here
            SizedBox(height: 16.h),
            Topcharts(),

            //weekly highlight
            WeeklyHighlight(),

            //deiver
            Divider(thickness: 1,color: Colors.grey.shade900,),
            //populer star
            PopulerStar()
          ],
        ),
      ),
    );
  }
}
