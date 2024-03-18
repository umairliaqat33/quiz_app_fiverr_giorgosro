import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/utils/colors.dart';

class NetworkConnectivitController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectivityStatus);
  }

  void _updateConnectivityStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        message: "No Internet",
        messageText: const Text(
          "Please connect to internet",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
        isDismissible: false,
        duration: const Duration(
          minutes: 1,
        ),
        icon: const Icon(
          Icons.wifi_off,
          color: whiteColor,
        ),
        margin: EdgeInsets.zero,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      Get.closeCurrentSnackbar();
    }
  }
}
