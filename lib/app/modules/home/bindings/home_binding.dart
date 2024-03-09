import 'package:get/get.dart';

import 'package:lolloweb/app/modules/home/controllers/language_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
  }
}
