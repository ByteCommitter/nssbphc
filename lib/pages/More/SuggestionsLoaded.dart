import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nssbphc/pages/base_widget.dart';

class SuccessScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(()=>BaseScreen());
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 35.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100.0),
          Container(
            height: 150,
            child: SvgPicture.asset('assets/images/suggestion.svg'),
          ),
          const SizedBox(height: 100.0),
          Text(
            'Suggestion Successfully Sent',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
