import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lolloweb/app/modules/home/controllers/home_controller.dart';
import 'package:lolloweb/app/modules/home/controllers/language_controller.dart';

class SettingsView extends GetView<HomeController> {
  SettingsView({Key? key}) : super(key: key);
  final lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    lang.update();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'impostazioni'.tr,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("testo"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("testo"),
                ],
              ),
            ),
            Obx(
              () => lang.langWidget(context),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(child: Text('my_nums2'.tr)),
          ],
        ),
      ),
    );
  }
}
