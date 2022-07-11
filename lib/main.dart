import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:hive_db_app/models/person_model.dart';
import 'package:hive_db_app/screens/home_screen.dart';
import 'package:hive_db_app/services/hiver_servie.dart';

void main(List<String> args) async {
  await HiveService.instance.init();
  Hive.registerAdapter(PersonAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    assert(Platform.isAndroid);
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put<HiveController>(HiveController());
            },
          ),
        ),
      ],
      title: 'Material App',
      initialRoute: '/',
    );
  }
}
