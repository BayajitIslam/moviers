import 'package:get/get.dart';

class SelectionController extends GetxService {
  var selectedIndexes = <int>{}.obs;

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
  }

  bool isSelected(int index) {
    return selectedIndexes.contains(index);
  }
}
