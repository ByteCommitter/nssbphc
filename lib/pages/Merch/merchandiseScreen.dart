
import 'package:flutter/material.dart';

class MerchPage extends StatefulWidget {

  @override
  _MerchPageState createState() => _MerchPageState();
}



class _MerchPageState extends State<MerchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: Text('Merchandise', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
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
