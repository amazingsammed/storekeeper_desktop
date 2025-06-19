import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/authentication/businessinfo.dart';



class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 300,
            child: Card(
              child: ListTile(
                title: Text(appbusiness.name),
                subtitle: Text(appbusiness.contact),
              ),
            ),
          ), Container(
            width:  300,
            child: Card(
              child: ListTile(
                title: Text(appbusiness.busid),
                subtitle: Text(appbusiness.type),
              ),
            ),
          )
        ],
      ),
    );
  }
}




