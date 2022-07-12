import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive/hive.dart' as hive;
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:hive_db_app/models/person_model.dart';
import 'package:path_provider/path_provider.dart' as path;

class HiveService {
  HiveService._();
  static final _ins = HiveService._();
  static HiveService get instance => _ins;

  var find = Get.find<HiveController>();
  Future<void> init() async {
    Platform.isAndroid || Platform.isIOS
        ? hive.Hive.init(await dirctory)
        : null;
    find.isInitialized.value = true;
    return;
  }

  Future<String> get dirctory async =>
      await path.getApplicationDocumentsDirectory().then((value) {
        log(value.path);
        return value.path;
      });

  /// opens the person box with given name
  Future<void> openPersons(String boxName) async {
    var b = await hive.Hive.openBox<Person>(boxName);
    find.personBox = b.obs;
    find.update();

    log('created box $boxName');
    return;
  }
}
