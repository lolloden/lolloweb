import 'dart:developer';
import 'dart:ui';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolloweb/app/modules/home/controllers/home_controller.dart';
import 'package:lolloweb/app/shared/classes/app_utils.dart';
import 'package:lolloweb/app/shared/constants.dart';

class LanguageController extends GetxController {
  final hc = Get.find<HomeController>();
  // current language
  RxString currentLanguage = "italiano".obs;

  //============= getters/setters
  // get current language
  get getLanguage => currentLanguage.value;
  // set current language
  set setLanguage(String val) {
    currentLanguage.value = val;
  }

  void updateLanguage(String val) {
    try {
      // set obs variable
      setLanguage = val;
      // update locales
      updateLocale(val);
      // write user settings
      hc.writeSetting("settings", "selected_lang", val);
    } on Exception catch (e) {
      AppUtils.showRetryError("$e\n(Error code 301)");
    }
  }

  void updateLocale(String? selectedLanguage) {
    switch (selectedLanguage) {
      case 'italiano':
        Get.updateLocale(const Locale('it_IT'));
        break;
      case 'english':
        Get.updateLocale(const Locale('en_US'));
        break;
      case 'espanol':
        Get.updateLocale(const Locale('es_ES'));
        break;
      default:
        Get.updateLocale(const Locale('it_IT'));
        break;
    }
  }

  Widget langWidget(BuildContext cont) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lang_label".tr,
            style: kStyle18,
          ),
          DropdownButton<String>(
            value: getLanguage,
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CountryFlag.fromLanguageCode(
                      AppUtils.getFlag(getLanguage))),
            ),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? val) {
              // This is called when the user selects an item.
              setLanguage = val!;
              updateLanguage(val);
            },
            items: langs.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    try {
      updateLanguage(getLanguage);
      log(getLanguage, name: "getLanguage");
    } on Exception catch (e) {
      AppUtils.showRetryError("$e\n(Error code 302)");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
