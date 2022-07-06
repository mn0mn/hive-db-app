import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:hive_db_app/services/hiver_servie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HiveController c = Get.find<HiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: c.key,
      appBar: AppBar(
        title: const Text('Hive App'),
      ),
      body: Obx(
        () => Container(
          color: c.isInitialized.value ? Colors.green : Colors.red,
          alignment: Alignment.center,
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List<Widget>.generate(
                9,
                growable: true,
                (index) => GestureDetector(
                  onLongPress: () => HiveService.instance.createBox('test'),
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      index.toString(),
                    ),
                  ),
                ),
              )..insert(
                  4,
                  GetBuilder<HiveController>(
                    init: Get.find<HiveController>(),
                    builder: (i) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(i.box.value == null
                                ? 'null'
                                : i.box.value!.name)
                          ],
                        ),
                      );
                    },
                  ),
                )),
        ),
      ),
    );
  }
}
