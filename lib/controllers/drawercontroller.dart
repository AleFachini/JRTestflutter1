import 'package:get/get.dart';

enum DrawerStatus { logged, home }

class ControllerForDrawer extends GetxController {
  final state = DrawerStatus.logged.obs;
  ControllerForDrawer();

  void goToState(DrawerStatus state) {
    this.state.value = state;
  }
}
