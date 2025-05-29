import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../shared/constant/colors.dart';
import '../../../shared/widgets/textfield.dart';
import '../../authentication/domain/model/profile.dart';


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




