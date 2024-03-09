import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolloweb/app/shared/constants.dart';

// utilità
abstract class AppUtils {
  // genera stringa random
  static String getRandomString(int length, {bool isNumber = true}) {
    final _chars = isNumber ? '1234567890' : 'abcdefghijklmnopqrstuvwxyz';
    final _rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(
            _chars.length,
          ),
        ),
      ),
    );
  }

  // get dialog
  static void loadingDialog() {
    closeDialog();

    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      name: 'loadingDialog',
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void showRetryError(String titolo) {
    showSnackbar(
        "generic_e".tr,
        const Icon(
          Icons.error_outline,
          color: Colors.black54,
        ),
        Colors.yellow.shade200,
        titolo,
        isError: true);
  }

  static void showSnackbar(
      String? message, Icon icon, Color colore, String titolo,
      {bool isError = false}) {
    closeSnackbar();

    String msgIsNullStr = "...";

    Get.snackbar(
      titolo,
      message ?? msgIsNullStr,
      icon: icon,
      snackPosition: SnackPosition.TOP,
      backgroundColor: colore,
      borderRadius: 10,
      margin: const EdgeInsets.all(15),
      colorText: Colors.black,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  static void showSnackbarWhiteText(
      String? message, Icon icon, Color colore, String titolo,
      {bool isError = false}) {
    closeSnackbar();

    String msgIsNullStr = "...";

    Get.snackbar(
      titolo,
      message ?? msgIsNullStr,
      icon: icon,
      snackPosition: SnackPosition.TOP,
      backgroundColor: colore,
      borderRadius: 10,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  static void showSnackbarInfo(String? message, Icon icon) {
    closeSnackbar();
    String msgIsNullStr = "...";
    Get.snackbar(
      "Info",
      message ?? msgIsNullStr,
      icon: icon,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blueGrey.shade300,
      borderRadius: 10,
      margin: const EdgeInsets.all(15),
      colorText: Colors.black,
      duration: const Duration(milliseconds: 900),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void goBackToScreen(String routeName) {
    Get.until(
      (route) => route.settings.name == routeName,
    );
  }

  static getFlag(String currentLang) {
    return flags[langs.indexWhere((element) => element == currentLang)]
            [currentLang]
        .toString();
  }

  static TextSpan defaultTextSpan(String text) => TextSpan(
        text: text,
      );

  static TextSpan highlightedTextSpan(String text) => TextSpan(
        text: text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );

  static TextSpan italicTextSpan(String text) => TextSpan(
        text: text,
        style: const TextStyle(fontStyle: FontStyle.italic),
      );

  static TextSpan outlinedTextSpan(String text) => TextSpan(
        // put space beside text in order to make text look nice
        text: ' $text ',
        style: TextStyle(background: textBorderPaint),
      );

  static Paint textBorderPaint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 3.0;
}
