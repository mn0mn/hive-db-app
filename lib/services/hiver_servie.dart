import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart' as hive;
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService._();
  static final _ins = HiveService._();
  static HiveService get instance => _ins;

  /// Initialize the Hive service, get the Hive dir.
  Future<void> init() async {
    Directory? dir =
        Platform.isAndroid ? await getExternalStorageDirectory() : null;
    dir == null ? Exception('dir not available') : null;
    print('Path: ${dir!.path}');
    hive.Hive.init(dir.path);
    log('Hive init');
    Get.find<HiveController>().isInitialized.value = true;
    return;
  }

  Future<void> createBox<T>(String boxName) async {
    var b = await hive.Hive.openBox<T>(boxName);
    var find = Get.find<HiveController>();
    find.box = b.obs;
    find.update();

    log('created box $boxName');
    return;
  }
}
