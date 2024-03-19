import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
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
      Get.dialog(
        barrierDismissible: false,
        const AlertDialog(
          icon: Icon(
            Icons.wifi_off,
            color: whiteColor,
            size: 20,
          ),
          title: Text(
            "No Internet",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: whiteColor,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Please connect to internet",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      Get.back();
    }
  }
}
