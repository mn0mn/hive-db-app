import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_db_app/models/person_model.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key? key, required this.person}) : super(key: key);
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                person.name,
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                person.lastName,
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text(
            person.age.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
