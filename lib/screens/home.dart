import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/controllers/homecontroller.dart';

final HomeController controller = Get.find<HomeController>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.redirectUrl('https://picsum.photos/id/10/2500/1667'),
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return snapshot.data;
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
