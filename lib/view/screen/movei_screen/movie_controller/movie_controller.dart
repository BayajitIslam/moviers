import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MovieController extends GetxController {
  late VideoPlayerController videoController;
  var isLoading = true.obs;

  /// Initialize video with a network URL
  void initVideo(String url) async {
    isLoading.value = true;
    videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    await videoController.initialize();
    videoController.setLooping(true);
    videoController.play();
    isLoading.value = false;

    //landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  /// Play / Pause toggle
  void togglePlayPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    update(); // update UI
  }

  @override
  void onClose() {
    videoController.dispose();
    //potrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onClose();
  }
}
