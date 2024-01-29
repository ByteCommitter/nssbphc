import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addAllowedId(String id) async {
  await FirebaseFirestore.instance.collection('allowed_ids').doc(id).set({});
}

Future<void> uploadAllowedIds(List<String> ids) async {
  for (String id in ids) {
    await addAllowedId(id);
  }
}

List<String> generateIds() {
  List<String> ids = [];

  List<String> years = ['18', '19', '20', '21', '22', '23'];
  List<String> codes = ['AA', 'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8'];
  List<String> types = ['PS', 'TS'];

  for (String year in years) {
    for (String code in codes) {
      for (String type in types) {
        for (int i = 1; i <= 3000; i++) {
          String number = i.toString().padLeft(4, '0'); // Pad with zeros to get 4 digits
          String id = '20' + year + code + type + number;
          ids.add(id);
        }
      }
    }
  }

  return ids;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              List<String> ids = generateIds();
              await uploadAllowedIds(ids);
            },
            child: Text('Upload IDs'),
          ),
        ),
      ),
    );
  }
}

