import '../../../utils/dummy_data.dart';
import 'package:get/get.dart';

import '../view/model/on_boarding_item.dart';

class OnBoardingController extends GetxController {
  int pageIndex = 0;

  List<OnBoardingItem> onBoardingList = DummyData.onBoarding;

  void updatePageIndex(int index) {
    pageIndex = index;
    update();
  }
}
