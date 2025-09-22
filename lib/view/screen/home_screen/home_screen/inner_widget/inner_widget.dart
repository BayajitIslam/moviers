import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/widget/custome_indicator/custome_indicator.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';
import 'package:moviers/view/widget/movei_information/movie_shorts_information.dart';

//top charts
class Topcharts extends StatelessWidget {
  Topcharts({super.key});

  //wekkly highlight list
  final List<Map<String, dynamic>> topCharts = [
    {
      "image": AppImage.movieTwo,
      "title": "Dune",
      "rating": 8.9,
      "year": "2021",
      "length": "2h 35m",
      "genre": "Action",
    },
    {
      "image": AppImage.movieThree,
      "title": "Suicide Squad",
      "rating": 7.6,
      "year": "2015",
      "length": "1h 24m",
      "genre": "Sci-Fi",
    },
    {
      "image": AppImage.movieOne,
      "title": "Rogue One: A Star Wars Story",
      "rating": 8.4,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 282.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.baseBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          //
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //top charts text
                CustomeText(text: AppString.topCharts),

                //view all
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.topChartsScreen);
                  },
                  child: CustomeText(
                    text: AppString.viewAll,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          //topcart card
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListView.builder(
                itemCount: topCharts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  
                  //individula movie
                  final movie = topCharts[index];
                  return TopChartCard(
                    ontap: () {
                      //view  movie detailse

                    },
                    image: movie["image"],
                    title: movie["title"],
                    rating: movie["rating"],
                    year: movie["year"],
                    lenght: movie["length"],
                    genre: movie["genre"],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//top chart card here

class TopChartCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final String year;
  final String lenght;
  final String genre;
  final void Function()? ontap;
  const TopChartCard({
    super.key,
    required this.genre,
    required this.image,
    required this.lenght,
    required this.rating,
    required this.title,
    required this.year,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: ontap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Container(
              width: 284.w,
              height: 160.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),

            //title
            SizedBox(height: 10.h),
            CustomeText(
              text: title,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
            ),

            //short desc
            SizedBox(height: 6.h),
            MovieShortsInformation(
              gap: 16,
              rating: rating,
              year: year,
              videoLength: lenght,
              genre: genre,
            ),
          ],
        ),
      ),
    );
  }
}

//wekkly highlight list
List<Map<String, dynamic>> weeklyHighlight = [
  {
    "image": AppImage.movieThree,
    "title": "Suicide Squad",
    "rating": 7.6,
    "year": "2015",
    "length": "1h 24m",
    "genre": "Sci-Fi",
  },
  {
    "image": AppImage.movieTwo,
    "title": "Dune",
    "rating": 8.9,
    "year": "2021",
    "length": "2h 35m",
    "genre": "Action",
  },
  {
    "image": AppImage.movieOne,
    "title": "Rogue One: A Star Wars Story",
    "rating": 8.4,
    "year": "2016",
    "length": "1h 54m",
    "genre": "Sci-Fi",
  },
];

//current page
var currentPages = 0.obs;

void setPages(int index) {
  currentPages.value = index;
}

//weekly highlights
class WeeklyHighlight extends StatelessWidget {
  const WeeklyHighlight({super.key});

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
            //weekly highlight text
            SizedBox(height: 24.h),
            CustomeText(text: AppString.weeklyHighlight),

            //card
            SizedBox(height: 10.h),
            Expanded(
              child: PageView.builder(
                itemCount: weeklyHighlight.length,
                onPageChanged: (index) {
                  setPages(index);
                },
                itemBuilder: (context, index) {
                  final highlight = weeklyHighlight[index];
                  return WeeklyHighlightCard(
                    image: highlight["image"],
                    title: highlight["title"],
                    rating: highlight["rating"],
                    year: highlight["year"],
                    lenght: highlight["length"],
                    genre: highlight["genre"],
                  );
                },
              ),
            ),

            //indicator
            SizedBox(height: 16.h),
            Obx(() => CustomeIndicator(index: currentPages.value)),
          ],
        ),
      ),
    );
  }
}

//weekly highlight card
class WeeklyHighlightCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final String year;
  final String lenght;
  final String genre;
  const WeeklyHighlightCard({
    super.key,
    required this.genre,
    required this.image,
    required this.lenght,
    required this.rating,
    required this.title,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(AppImage.videoPlayer),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        //title
        SizedBox(height: 10.h),
        CustomeText(
          text: title,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
        ),

        //short desc
        SizedBox(height: 6.h),
        MovieShortsInformation(
          gap: 16,
          rating: rating,
          year: year,
          videoLength: lenght,
          genre: genre,
        ),
      ],
    );
  }
}

//Populer Star

//populer star list
List<Map<String, dynamic>> populerStar = [
  {"image": AppImage.chrisEvan, "name": "Chris Evans"},
  {"image": AppImage.rober, "name": "Robert Downey"},
  {"image": AppImage.watson, "name": "Emma Watson"},
  {"image": AppImage.stone, "name": "Emma Stone"},
];

class PopulerStar extends StatelessWidget {
  const PopulerStar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194.h,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //populer star text
            SizedBox(height: 16.h),
            CustomeText(text: AppString.popularStar),

            //card start
            Expanded(
              child: ListView.builder(
                itemCount: populerStar.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //individula  star
                  final star = populerStar[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Profile pic
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 100.h,
                          width: 100.w,
                          child: Image.asset(star["image"], fit: BoxFit.cover),
                        ),

                        //star name
                        SizedBox(height: 10.h),
                        CustomeText(
                          text: star['name'],
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
