
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DashboardAction extends StatelessWidget {
  const DashboardAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(icon: Icon(Icons.person), onPressed: (){}),
        IconButton(icon: Icon(Icons.logout), onPressed: (){
          Get.back();
        }),
      ],
    );
  }
}
