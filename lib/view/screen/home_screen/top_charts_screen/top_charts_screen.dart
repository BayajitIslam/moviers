import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/screen/home_screen/top_charts_screen/top_chart_card/top_chart_card.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class TopChartsScreen extends StatelessWidget {
  TopChartsScreen({super.key});

  //top charts movie list
  final List<Map<String, dynamic>> topChartsV2 = [
    {
      "image": AppImage.legends,
      "title": "Legends",
      "rating": 8.4,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Action",
    },
    {
      "image": AppImage.theGoodDinosaur,
      "title": "The Good Dinosaur",
      "rating": 8.4,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },
    {
      "image": AppImage.soul,
      "title": "Soul",
      "rating": 8.7,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },

    {
      "image": AppImage.brave,
      "title": "Brave",
      "rating": 8.9,
      "year": "2019",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },
    {
      "image": AppImage.legends,
      "title": "Legends",
      "rating": 8.4,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Action",
    },
    {
      "image": AppImage.theGoodDinosaur,
      "title": "The Good Dinosaur",
      "rating": 8.4,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },
    {
      "image": AppImage.soul,
      "title": "Soul",
      "rating": 8.7,
      "year": "2016",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },

    {
      "image": AppImage.brave,
      "title": "Brave",
      "rating": 8.9,
      "year": "2019",
      "length": "1h 54m",
      "genre": "Sci-Fi",
    },
  
    
  ];

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
          text: AppString.topCharts,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: topChartsV2.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 158.w / 295.h,
          ),
          itemBuilder: (context, index) {

            //indivdula movie
            final movie = topChartsV2[index];

            return TopChartCardV2(
              imagePath: movie["image"],
              title: movie["title"],
              rating: movie["rating"],
              year: movie["year"],
              lenght: movie["length"],
            );
          },
        ),
      ),
    );
  }
}
