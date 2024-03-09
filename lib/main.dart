import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolloweb/app/modules/home/controllers/home_controller.dart';
import 'package:lolloweb/app/routes/app_pages.dart';
import 'package:lolloweb/app/shared/classes/translation.dart';
import 'package:lolloweb/app/shared/constants.dart';

void main() async {
  await HomeController.initServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.fade,
      title: appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
