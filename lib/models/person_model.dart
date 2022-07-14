import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive/hive.dart';
part 'person_model.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final int age;

  Person(this.name, this.lastName, this.age);

  factory Person.dummy(int age) {
    return Person('name', 'lastName', age);
  }
}
