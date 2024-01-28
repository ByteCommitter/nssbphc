
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nssbphc/pages/Events/EventsScreen.dart';
import 'package:nssbphc/pages/More/AboutUs.dart';

class AddEventPage extends StatefulWidget {

  @override
  _AddEventPageState createState() => _AddEventPageState();
}



class _AddEventPageState extends State<AddEventPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      //create a back button at the appbar
      leading: IconButton(onPressed: (){
        Get.to(()=>EventPage());
      }, icon:const Icon(Icons.arrow_back_ios_outlined) ),
      title:const Text('Add Event', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    ),
  );
  }
}
