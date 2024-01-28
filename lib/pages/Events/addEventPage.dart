import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nssbphc/pages/Events/EventsScreen.dart';


class AddEventPage extends StatefulWidget {

  @override
  _AddEventPageState createState() => _AddEventPageState();
}



class _AddEventPageState extends State<AddEventPage> {
  @override
  void initState() {
    super.initState();
  }
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

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
    
    body:Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20), // Add some spacing between the fields
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10), // Add some spacing between the fields
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 10), // Add some spacing between the fields
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 25), // Add some spacing between the fields
          ElevatedButton(
            onPressed: () async {
              // Show a CircularProgressIndicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      width: 20,
                      height: 260,
                      child:CircularProgressIndicator(color: Colors.deepPurple[200]),
                      ),
                    contentPadding: EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  );
                },
              );

              // Create a new document in Firestore
              CollectionReference users = FirebaseFirestore.instance.collection('Trial');
              await users.add({
                'Name': nameController.text,
                'Age': ageController.text,
                'Location': locationController.text,
              }).then((value) {
                // Close the CircularProgressIndicator
                Navigator.of(context).pop();

                // Show a toast message
                Fluttertoast.showToast(
                  msg: "Data sent successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                );

                // Navigate to the EventPage
              }).catchError((error) {
                // Close the CircularProgressIndicator and show an error message
                Navigator.of(context).pop();
                Fluttertoast.showToast(
                  msg: "Failed to send data: $error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.orangeAccent,
                );
              });
            },
            child: const Text('Add Event'),
          )
        ],
      ),
    )
  );
  }
}



