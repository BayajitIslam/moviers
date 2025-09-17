import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/utils/app_image.dart';
import 'package:moviers/utils/app_string.dart';
import 'package:moviers/view/screen/personalization_screen/genre_card/genre_card.dart';
import 'package:moviers/view/screen/personalization_screen/selection_controller/selection_controller.dart';
import 'package:moviers/view/widget/custome_button/custome_button.dart';
import 'package:moviers/view/widget/custome_text/custome_text.dart';

class PersonalizationScreen extends StatelessWidget {
  PersonalizationScreen({super.key});

  //genre list
  final List<Map<String, dynamic>> genre = [
    {"title": "Action", "likes": 4324, "image": AppImage.action},
    {"title": "Adventure", "likes": 2592, "image": AppImage.adventure},
    {"title": "Comedy", "likes": 920, "image": AppImage.comedy},
    {"title": "Drama", "likes": 1423, "image": AppImage.drama},
    {"title": "Horror", "likes": 600, "image": AppImage.action},
    {"title": "Fantasy", "likes": 1100, "image": AppImage.adventure},
  ];

  //initialize selection controller
  final SelectionController selectionController = Get.put(
    SelectionController(),
  );

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
          text: AppString.personalization,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //text
                CustomeText(
                  text: AppString.choiceYourGenre,
                  color: AppColors.neutral60,
                  fontSize: 16,
                ),

                //count
                Obx(
                  () => CustomeText(
                    text:
                        "${selectionController.selectedIndexes.length}${AppString.from}",
                    color: AppColors.brand,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            //all genre
            SizedBox(height: 24.h),
            Expanded(
              child: GridView.builder(
                itemCount: genre.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  //individual genre
                  final genreItem = genre[index];
                  return Obx(
                    () => GenreCard(
                      imagePath: genreItem['image'],
                      title: genreItem["title"],
                      likes: genreItem["likes"],
                      isSelected: selectionController.isSelected(index),
                      ontap: () {
                        selectionController.toggleSelection(index);
                      },
                    ),
                  );
                },
              ),
            ),

            //continue button
            CustomeButton(
              width: double.infinity,
              height: 48.h,
              buttonName: AppString.coontinue,
              onTap: () {
                //route to home
                Get.toNamed(AppRoutes.homeScreen);
              },
            ),
            SizedBox(height: 39.h),
          ],
        ),
      ),
    );
  }
}
