import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/screen/movie_detailse_screen/inner_widget/inner_widget.dart';
import 'package:moviers/view/widget/custome_button/custome_button.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';
import 'package:moviers/view/widget/movei_information/movie_shorts_information.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});

  //movie argument

  final movie = Get.arguments;

  @override
  Widget build(BuildContext context) {
    //desc
    final String desc = movie["desc"];

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
                  child: Image.asset(movie['image'], fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 10,
                  left: 24,
                  right: 24,
                  child: CustomeText(
                    text: movie["title"],
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    maxLines: 2,
                    textAlign: TextAlign.start,
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
                      gap: 16,
                      rating: movie["rating"],
                      year: movie["year"],
                      videoLength: movie["length"],
                      genre: movie["genre"],
                    ),
                  ],
                ),
              ),
            ),

            //Video Description
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                maxLines: 3,
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <InlineSpan>[
                    //desc
                    TextSpan(
                      text: desc.length > 170
                          ? "${desc.substring(0, 168)}..."
                          : desc,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // see more button
                    if (desc.length > 170)
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: GestureDetector(
                          onTap: () {
                            //show bottomSheet
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => Container(
                                width: double.infinity,
                                height: 560.h,
                                decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          width: 48,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryText,
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),

                                          child: CustomeText(text: ""),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 40.0,
                                          right: 32,
                                        ),
                                        child: CustomeText(
                                          text: movie["title"],
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16.0,
                                        ),
                                        child: CustomeText(
                                          text: desc,
                                          fontSize: 14,
                                          maxLines: desc.length,
                                          textAlign: TextAlign.start,
                                          color: AppColors.neutral60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CustomeText(
                            text: "More",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.brand,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            //Trailers
            SizedBox(height: 15),
            TrailerDesign(movieTrailer: movie["trailer"]),

            //watch now and watchlist
            SizedBox(height: 24.h),

            SizedBox(height: 44.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  String movieLink = movie["movieLink"];

                  Get.toNamed(AppRoutes.movieScreen, arguments: movieLink);
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
      ),
    );
  }
}
