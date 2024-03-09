import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lolloweb/app/modules/home/controllers/language_controller.dart';
import 'package:lolloweb/app/shared/drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    lang.update();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
