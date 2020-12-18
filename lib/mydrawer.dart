import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/controllers/drawercontroller.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Text('UrbeTrack Menu'),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
              ),
            ),
          ),
          ListTile(
            title: Text('Logged'),
            onTap: () {
              Navigator.pop(
                  context); //this order wroks, putting Navigator after get won't work
              Get.find<ControllerForDrawer>().goToState(DrawerStatus.logged);
            },
          ),
          Divider(
            color: Colors.blueGrey[200],
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              Get.find<ControllerForDrawer>().goToState(DrawerStatus.home);
            },
          ),
          Divider(
            color: Colors.blueGrey[200],
          ),
        ],
      ), // Populate the Drawer in the next step.
    );
  }
}
