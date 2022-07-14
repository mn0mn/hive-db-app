import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:hive_db_app/controllers/hive_controller.dart';
import 'package:hive_db_app/models/person_model.dart';
import 'package:hive_db_app/services/hiver_servie.dart';
import 'package:hive_db_app/widgets/person_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required BuildContext context}) : super(key: key);
  final HiveController c = Get.find<HiveController>();

  @override
  Widget build(context) {
    return Obx(
      () {
        var ageController = TextEditingController();
        var lastNameC = TextEditingController();
        var NameC = TextEditingController();

        return Scaffold(
          key: c.key,
          appBar: AppBar(
            elevation: 0.00,
            backgroundColor: const Color.fromARGB(255, 21, 197, 80),
            title: Text('Hive App  ${(c.isInitialized.value) ? '🙂' : '🙃'}'),
            bottom: TabBar(
              unselectedLabelColor: Colors.red,
              physics: const BouncingScrollPhysics(),
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create person',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Persons',
                    style: context.textTheme.titleMedium,
                  ),
                )
              ],
              controller: c.tabController,
            ),
          ),
          body: Container(
            color: c.color.value,
            alignment: Alignment.center,
            child: TabBarView(
              controller: c.tabController,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter Name',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        color: Colors.white,
                        child: TextFormField(
                          controller: NameC,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Enter Last Name',
                        style: context.textTheme.displaySmall,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        color: Colors.white,
                        child: TextFormField(
                          controller: lastNameC,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Enter Age',
                        style: context.textTheme.displaySmall,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        color: Colors.white,
                        child: TextFormField(
                          controller: ageController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            fillColor: Colors.black,
                            filled: true,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await HiveService.instance.writePerosn(Person(
                            NameC.text,
                            lastNameC.text,
                            int.parse(ageController.text.isEmpty
                                ? '0'
                                : ageController.text),
                          ));
                        },
                        child: Text(
                          'add',
                          style: context.textTheme.displaySmall,
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  key: c.key2,
                  controller: ScrollController(),
                  child: GetBuilder<HiveController>(
                    builder: (i) => Column(
                      children: i.personBox.value == null
                          ? []
                          : i.personBox.value!.values
                              .map(
                                (e) => PersonWidget(person: e),
                              )
                              .toList(growable: true),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
