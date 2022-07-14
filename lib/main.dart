import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:hive_db_app/models/person_model.dart';
import 'package:hive_db_app/screens/home_screen.dart';
import 'package:hive_db_app/services/hiver_servie.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(
            context: context,
          ),
          binding: BindingsBuilder(
            () => Get.put<HiveController>(HiveController()),
          ),
        ),
      ],
      title: 'Material App',
      initialRoute: '/',
    );
  }
}
