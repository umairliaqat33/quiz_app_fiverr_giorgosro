import 'package:get/instance_manager.dart';

import 'package:quiz_app/controller/network_connectivity_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkConnectivitController>(
      NetworkConnectivitController(),
      permanent: true,
    );
  }
}
