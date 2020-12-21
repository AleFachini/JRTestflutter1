import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbetrack_101/model/entry.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final entry = Rx<Entry>();
  Future<List<Entry>> futureResponse;
  //all entries
  final List<Entry> listEntries = new List<Entry>();
  //Obs for making the Listview, redibuja el listview?
  final listView = List<Entry>().obs;
  //Current Details URL
  String currentUrl = '';

  Future<List<Entry>> fetchEntries() async {
    final response = await http.get('https://picsum.photos/v2/list');
    if (response.statusCode != 200) {
      throw (response.body);
    }
    //parseJSON
    List<dynamic> entriesList = jsonDecode(response.body);
    List<Entry> entries =
        entriesList.map((entriesList) => Entry.fromJson(entriesList)).toList();
    print('${entries.length}');
    print('${entries[3].id}');
    listEntries.clear();
    listEntries.addAll(entries);
    return listEntries;
  }

  //String redirectUrl(String url)
  Future<Image> redirectUrl(String url) async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw (response.headers);
    }
    Uint8List body = response.bodyBytes;
    //Map<String, String> header = response.headers;//debug
    return Image.memory(
      body,
      height: 400,
      width: 400,
    );
  }

  void setCurrentEntry(Entry entry) {
    this.entry.value = entry;
    return;
  }

  Entry getCurrentEntry() {
    return this.entry.value;
  }

  void loadMore() {
    return;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('Init HomeController');
    //fetch JSON when i start controller
    futureResponse = fetchEntries();
  }
}
