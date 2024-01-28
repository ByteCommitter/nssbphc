import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool isAdmin = true; //isAdmin will depend on the login page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Trial').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.data == null) {
                    return ListView();
                  }

                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: ListTile(
                            title: Text('Name: ${data['Name']}'),
                            subtitle: Text('Age: ${data['Age']}\nLocation: ${data['Location']}'),
                            trailing: 
                            Visibility(visible: isAdmin,
                              child: 
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await FirebaseFirestore.instance.collection('Trial').doc(document.id).delete();
                                    Fluttertoast.showToast(
                                      msg: "Data deleted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.orange
                                    );
                                  },
                                ),
                            )
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: isAdmin,
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => AddEventPage());
          },
          label: Text('Add Event',style: TextStyle(color: Colors.white),),
          icon: Icon(Icons.add_outlined,color: Colors.white,),
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}