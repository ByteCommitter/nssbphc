import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:nssbphc/config/styling.dart';
import 'package:nssbphc/pages/More/SuggestionsLoaded.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:nssapp/models/loginManager.dart';

class DropSuggestionsScreen extends StatefulWidget {
  const DropSuggestionsScreen({Key? key}) : super(key: key);

  @override
  _DropSuggestionsScreenState createState() =>_DropSuggestionsScreenState();
}

class _DropSuggestionsScreenState
    extends State<DropSuggestionsScreen> {
  final titleController = TextEditingController();
  final suggestionController = TextEditingController();
  final maxLines = 10;
  @override
  Widget build(BuildContext context) {
    //final isAdmin = Provider.of<LoginManager>(context, listen: false).isAdmin;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          //isAdmin ?
           "View Suggestions",
           // : 'Drop Suggestions',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: //isAdmin
          //? SuggestionsList():
           ListView(
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
            ),
    );
  }

 

  void _onSubmit() async {
    //final name = context.read<LoginManager>().user.name;
    //push it to the firebase collection - Suggestions which has the fields dec and title
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
