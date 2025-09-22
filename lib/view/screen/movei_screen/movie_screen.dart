import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviers/utils/app_colors.dart';
import 'package:moviers/view/screen/movei_screen/movie_controller/movie_controller.dart';
import 'package:video_player/video_player.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  final MovieController controller = Get.find<MovieController>();

  final movieLink = Get.arguments;

  @override
  Widget build(BuildContext context) {
    //init video
    controller.initVideo(movieLink);

    //go back to potrait mode
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryText),
            );
          } else {
            return FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: SizedBox(
                  width: controller.videoController.value.size.width,
                  height: controller.videoController.value.size.height,
                  child: VideoPlayer(controller.videoController),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
