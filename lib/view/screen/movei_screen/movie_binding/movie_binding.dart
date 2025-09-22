import 'package:get/get.dart';
import 'package:moviers/view/screen/movei_screen/movie_controller/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
  }
}
