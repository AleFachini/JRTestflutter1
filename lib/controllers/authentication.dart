import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:urbetrack_101/screens/logged.dart';
import 'package:urbetrack_101/screens/login.dart';

class AuthController extends GetxController {
  final validated = false.obs;
  final username = ''.obs;
  final box = GetStorage();

  AuthController();

  void checkPass(String pass) {
    if (pass == '123456') {
      //Get.snackbar('OK', 'Logged In');//En logged screen debe ir
      box.write('status', true);
      username.value = box.read('username');
      print('checkPass ${username.value}');
      Get.to(Logged());
      Get.snackbar(
        'OK',
        "You've Logged In!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar('ERROR', 'Incorrect password');
    }
    return;
  }

  String getUser() {
    username.value = box.read('username');
    //print('${username.value}');
    return username.value;
  }

  void setUser(String user) {
    box.write('username', user);
    print('USUARIO CAMBIA: ${user}');
    return;
  }

  void logout() {
    box.write('status', false);
    Get.off(Login());
    return;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('AuthController Initialized');
    //init internal storage status
    box.writeIfNull('username', '');
    box.writeIfNull('status', false);
    username.value = box.read('username');
    print('username: ${username.value}');
    validated.value = box.read('status');
    print('status: ${validated.value}');
    //check status variable
    if (box.read('status')) {
      this.validated.value = true;
    }
  }
}
