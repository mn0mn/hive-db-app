import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_app/models/person_model.dart';

import '../services/hiver_servie.dart';

class HiveController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //

  //
  //keys
  var key = GlobalKey<ScaffoldState>();
  var key1 = GlobalKey<ScrollableState>();
  var key2 = GlobalKey<ScrollableState>();
  //
  //controllers
  late final Rx<TabController> tabController;
  late RxInt index;
  final TextEditingController tc1 = TextEditingController();
  final TextEditingController tc2 = TextEditingController();
  final sc1 = ScrollController();
  //
  //hive
  RxBool isInitialized = false.obs;
  Rx<Box<Person>?> personBox = null.obs;
  Rx<Color> color = Colors.red.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this, initialIndex: 0).obs;
    index = tabController.value.index.obs;
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    HiveService.instance.openPersons();
    color.value = Colors.green;
    // key.currentState!.build(key.currentState!.context);
    super.onReady();
  }
}
