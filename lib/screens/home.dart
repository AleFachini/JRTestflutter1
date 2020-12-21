import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/controllers/homecontroller.dart';

final HomeController controller = Get.find<HomeController>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: controller.listEntries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[50],
            child: GestureDetector(
              onTap: () {
                //Setting details url
                controller.setCurrentEntry(controller.listEntries[index]);
                print('ID: ${controller.listEntries[index].id}');
                Get.to(DetailedView());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      'Author: ${controller.listEntries[index].author}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Tap for Details.'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class DetailedView extends StatelessWidget {
  TextStyle detailTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontFamily: "Roboto",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Container(
        color: Colors.purple[100],
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ID: ${controller.getCurrentEntry().id}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Author: ${controller.getCurrentEntry().author}',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Url: ${controller.getCurrentEntry().url}',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Download Url: ${controller.getCurrentEntry().download_url}',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: FutureBuilder(
                future: controller.redirectUrl(controller
                    .getCurrentEntry()
                    .download_url), //it's not reactive it wont use .value
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
                },
              ), //ImageFutureBuilder
            ),
          ],
        ),
      ),
    );
  }
}
