import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nssbphc/pages/More/SuggestionsLoaded.dart';

class DropSuggestionsScreen extends StatefulWidget {
  const DropSuggestionsScreen({Key? key}) : super(key: key);

  @override
  _DropSuggestionsScreenState createState() =>_DropSuggestionsScreenState();
}

class _DropSuggestionsScreenState extends State<DropSuggestionsScreen> {
  final titleController = TextEditingController();
  final suggestionController = TextEditingController();
  final maxLines = 10;
  Future<void>? submitFuture;
  @override
  Widget build(BuildContext context) {
    bool isAdmin = false; //changes according to the login

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Drop Suggestions",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isAdmin ? buildSuggestionsList() : buildSuggestionForm(),
    );
  }

  Widget buildSuggestionsList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Suggestions').snapshots(),
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
                  title: Text('Title: ${data['title']}',style: TextStyle(fontSize: 18),),
                  subtitle: Text('Suggestion: ${data['desc']}'),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget buildSuggestionForm() {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          child: TextField(
            controller: titleController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title',
            ),
          ),
        ),
        Container(
          height: maxLines * 24,
          margin:const EdgeInsets.all(12),
          child: TextField(
            maxLines: maxLines,
            controller: suggestionController,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Suggestion',
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(100.0),
          child: InkWell(
            onTap: _onSubmit,
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

 Future<void> _onSubmit() async {
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Add a new document to the "Suggestions" collection
    await firestore.collection('Suggestions').add({
      'title': titleController.text,
      'desc': suggestionController.text,
    });
    Get.to(() => SuccessScreen());

    titleController.text = "";
    suggestionController.text = "";
  }
}