import 'dart:async';
import 'package:get/get.dart';
import 'package:moviers/core/app_routes/app_routes.dart';

class SplashController extends GetxService {
  Timer? timer;
  var opacity = 0.0.obs;

  //final LocalStorage _localStorage = Get.put(LocalStorage());

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (opacity.value != 1.0) {
        opacity.value += 0.5;
      }
    });

    Future.delayed(Duration(seconds: 3), () async {
      Get.offAndToNamed(AppRoutes.onBoarding);
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
