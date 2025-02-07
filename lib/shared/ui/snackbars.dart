import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


showErrorSnackbar({required String message}) {
  return Get
    ..closeAllSnackbars()
    ..snackbar(
      "Error",
      message,
      backgroundColor: Get.theme.colorScheme.errorContainer,
      colorText: Get.theme.colorScheme.onErrorContainer,
      shouldIconPulse: true,
      barBlur: 10,
      icon: const Icon(Icons.warning),
    );
}

showSuccessSnackbar({required String message}) {
  return Get
    ..closeAllSnackbars()
    ..snackbar(
      "Success",
      message,
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      colorText: Get.theme.colorScheme.onPrimaryContainer,
      icon: const Icon(Icons.check),
      shouldIconPulse: true,
    );
}

showLoadingSnackbar({required String message, bool isPersistent = false, title = "Loading"}) {
  return Get
    ..closeAllSnackbars()
    ..snackbar(
      title,
      message,
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      colorText: Get.theme.colorScheme.onPrimaryContainer,
      showProgressIndicator: true,
      icon: const Icon(Icons.upload),
      duration: isPersistent ? const Duration(days: 365) : const Duration(seconds: 5),
      isDismissible: !isPersistent,
      shouldIconPulse: true,
    );
}
