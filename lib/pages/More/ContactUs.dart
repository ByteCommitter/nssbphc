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
        title: const Text('Contact Page',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index)
        /*{
          final person = people[index];
          return ListTile(
            onTap: () => launch("tel://${person.phoneNumber}"),
            leading: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () => launch("tel://${person.phoneNumber}"),
            ),
            title: Text(
              person.name,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              person.designation,
              style: TextStyle(fontSize: 16),
            ),
          );
        },*/
        
         {
          final person = people[index];
          return GestureDetector(
            onTap: () => launch("tel://${person.phoneNumber}"),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(19),
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone,color: Colors.white,),
                  Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            person.name,
                            style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            person.designation,
                            style: TextStyle(fontSize: 17, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  Text(person.name[0],style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              )
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