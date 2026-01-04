import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/styles.dart';

class CustomSnackBar {
  static void showError(String message) =>
      show(title: 'Error', message: message, color: AppColors.errorRed);

  static void showSuccess(String message) =>
      show(title: 'Success', message: message, color: AppColors.successGreen);

  static void showInfo(String message) =>
      show(title: 'Alert', message: message, color: AppColors.primaryColor);

  static void show(
      {required String title, required String message, required Color color}) {
    Get.snackbar(
      title,
      message,
      snackPosition: kIsWeb ? SnackPosition.TOP : SnackPosition.TOP,
      backgroundColor: color,
      colorText: AppColors.white,
      borderRadius: 12,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      // overlayColor: Colors.black87.withValues(alpha: 0.7),
      // overlayBlur: 3,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      maxWidth: 500,

      snackStyle: SnackStyle.FLOATING,
      titleText: Text(
        title,
        style: Styles.tsWhiteRegular18,
      ),
      messageText: Text(
        message,
        style: Styles.tsWhiteRegular16,
      ),
    );
  }

  static void showBottomSnackBar(
      {required String title, required String message, required Color color,required bool isBottom}) {
    Get.snackbar(
      title,
      message,
      snackPosition: isBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
      backgroundColor: color,
      colorText: AppColors.white,
      borderRadius: 12,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      overlayColor: Colors.black87.withValues(alpha: 0.7),
      overlayBlur: 3,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      maxWidth: 500,

      snackStyle: SnackStyle.FLOATING,
      titleText: Text(
        title,
        style: Styles.tsWhiteRegular18,
      ),
      messageText: Text(
        message,
        style: Styles.tsWhiteRegular16,
      ),
    );
  }
}
