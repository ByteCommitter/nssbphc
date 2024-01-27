import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final List<Person> people = [
    Person(name: 'Person 1', designation: 'Designation 1', phoneNumber: '1234567890'),
    Person(name: 'Person 2', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 3', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 4', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 5', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 6', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 7', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 8', designation: 'Designation 2', phoneNumber: '0987654321'),
    Person(name: 'Person 9', designation: 'Designation 2', phoneNumber: '0987654321'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Page'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return GestureDetector(
            onTap: () => launch("tel://${person.phoneNumber}"),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    person.name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    person.designation,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class Person {
  final String name;
  final String designation;
  final String phoneNumber;

  Person({required this.name, required this.designation, required this.phoneNumber});
}