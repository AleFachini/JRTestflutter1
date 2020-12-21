import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/controllers/drawercontroller.dart';
import 'package:urbetrack_101/controllers/homecontroller.dart';
import '../controllers/authentication.dart';

import '../mydrawer.dart';
import 'home.dart';
import 'login.dart';

class Logged extends GetView<AuthController> {
  //Este se obtiene con GetView
  final AuthController controller = Get.find<AuthController>();
  //Este se importa individualmente
  final ControllerForDrawer drawerController = Get.put(ControllerForDrawer());
  //Controller for JSON serialization and Listview
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged'),
        //automaticallyImplyLeading: false,
      ),
      drawer: MyDrawer(),
      body: GetX<ControllerForDrawer>(
        init: ControllerForDrawer(),
        builder: (drawerController) {
          print('${drawerController.state.value}');
          if (drawerController.state.value == DrawerStatus.home) {
            //homeController.fetchEntries();//fetch JSON everytime i click
            return Home();
          }
          if (drawerController.state.value == DrawerStatus.logged) {
            return Container(
              color: Colors.purple[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Logged In as: ${controller.getUser()}')),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
          drawerController.goToState(DrawerStatus.logged);
        },
        tooltip: 'Logout',
        child: const Icon(Icons.keyboard_backspace),
      ),
    );
  }
}
