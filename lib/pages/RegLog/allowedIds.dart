import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'allIds.dart'; // Import the file containing the IDs

class UploadIds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Upload IDs'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await uploadAllowedIds(Allids); // Use the idsList from ids.dart
            },
            child: Text('Upload IDs'),
          ),
        ),
      ),
    );
  }

  // Define the uploadAllowedIds method
  Future<void> uploadAllowedIds(List<String> ids) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();

    int counter = 0;
    for (String id in ids) {
      DocumentReference docRef = firestore.collection('allowed_ids').doc(id);
      batch.set(docRef, <String, dynamic>{});

      counter++;
      if (counter == 500) {
        await batch.commit();
        batch = firestore.batch();
        counter = 0;
      }
    }

    if (counter > 0) {
      await batch.commit();
    }
  }
}