import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/controllers/authentication.dart';

import 'logged.dart';
import 'login.dart';

class Root extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<AuthController>(AuthController());
      },
      builder: (_) {
        if (Get.find<AuthController>().validated.value == true) {
          print('Return Logged');
          return Logged();
        } else {
          print('Return Login');
          return Login();
        }
      },
    );
  }
}
