import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/controllers/authentication.dart';

import 'home.dart';

class Login extends GetView<AuthController> {
  final AuthController controller = Get.find<AuthController>();
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                obscureText: false, //set true to hide text
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
                onChanged: (value) {
                  controller.setUser(value);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                obscureText: true, //set true to hide text
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
                onSubmitted: (value) {
                  print('$value');
                  password = value;
                },
              ),
            ),
            TextButton(
              child: Text('SIGN IN'),
              onPressed: () => controller.checkPass(password),
            ),
          ],
        ),
      ),
    );
  }
}
