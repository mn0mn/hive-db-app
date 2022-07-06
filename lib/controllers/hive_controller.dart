import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../services/hiver_servie.dart';

class HiveController extends GetxController {
  var key = GlobalKey<ScaffoldState>();
  RxBool isInitialized = false.obs;
  Rx<Box?> box = null.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    HiveService.instance.init();
    super.onReady();
  }
}
