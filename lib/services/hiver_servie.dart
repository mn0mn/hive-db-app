import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart' as hive;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:hive_db_app/models/person_model.dart';
import 'package:path_provider/path_provider.dart' as path;

class HiveService {
  HiveService._();
  static final _ins = HiveService._();
  static HiveService get instance => _ins;
  final adapter = PersonAdapter();

  var find = Get.find<HiveController>();
  Future<void> init() async {
    Platform.isAndroid || Platform.isIOS ? await hive.Hive.initFlutter() : null;
    find.isInitialized.value = true;
    return;
  }

  Future<String> get dirctory async =>
      await path.getApplicationDocumentsDirectory().then((value) {
        log(value.path);
        return value.path;
      });

  /// opens the person box with given name
  Future<void> openPersons() async {
    var b = await hive.Hive.openBox<Person>('persons');
    find.personBox = b.obs;
    find.update();

    log('opened box ${b.name}');
    return;
  }

  //TODO: Write Persons
  Future<void> writePerosn(Person person) async {
    await find.personBox.value!.add(person);
    log('added ${person.name}');
    find.update();
  }
  //TODO: Read Persons
  //TODO: Update Persons
  //TODO: Delete Persons
}
