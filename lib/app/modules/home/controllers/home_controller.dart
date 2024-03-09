import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolloweb/app/shared/classes/app_utils.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  // user settings
  Map<String, List<dynamic>> settings = <String, List<dynamic>>{
    "selected_lang": ["italiano", "Language"],
    "pizza": ["margherita", "pizza preferita"],
    "num": [4, "numero fortunato"],
  };

  static Future<void> initServices() async {
    try {
      await GetStorage.init('settings');
    } on Exception catch (e) {
      AppUtils.showSnackbarWhiteText(
          e.toString(),
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          Colors.purple.shade400,
          "error 102");
    }
  }

  void readWriteUserSettings() {
    settings.forEach((k, v) {
      final dynamic val = readSetting("settings", k);
      if (val == null) {
        writeSetting("settings", k, v[0]);
      } else {
        settings[k] = [val, v[1]];
        //log(val.toString(), name: "settings -->");
      }
    });
  }

  /* Map<String, dynamic> readAllSetting1() {
    final Map<String, List<dynamic>> results = <String, List<dynamic>>{};
    mappa1.forEach((k, v) {
      final dynamic val = readSetting("internals", k);
      results[k] = [val, v[1]];
    });
    return results;
  } */

  dynamic readSetting(String box, String data) {
    GetStorage setting = GetStorage(box);
    if (setting.hasData(data)) {
      var result = setting.read(data);
      return result;
    }
    return null;
  }

  void writeSetting(String box, String data, dynamic val) {
    GetStorage setting = GetStorage(box);
    setting.write(data, val);
  }

  void resetSetting(String box) {
    GetStorage setting = GetStorage(box);
    setting.erase();
  }

  @override
  void onInit() async {
    super.onInit();
    await initServices();
    readWriteUserSettings();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
