
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nssbphc/pages/Events/addEventPage.dart';

class EventPage extends StatefulWidget {

  @override
  _EventPageState createState() => _EventPageState();
}



class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: Text('Events', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
    ),
    body: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    ),

    floatingActionButton: 
    Visibility(visible: true,
      child: 
        FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => AddEventPage());
          },
          label: Text('Add Event'),
          icon: Icon(Icons.add_outlined),
          backgroundColor: Colors.deepPurple,
        ),
    ),
  );
  }
}
