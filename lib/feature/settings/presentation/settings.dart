import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('LogOut')),
      ),
    );
  }
}




