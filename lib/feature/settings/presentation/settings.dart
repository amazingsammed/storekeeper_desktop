import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MySettingsPage extends StatefulWidget  {
  late TabController controller;
   MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();

}

class _MySettingsPageState extends State<MySettingsPage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
  widget.controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          bottom: TabBar(
              controller: widget.controller,
              tabs: [
            Tab(
              text: "General",
            ),
            Tab(
              text: "App",
            ),
            Tab(
              text: "About",
            ),
          ]),
        ),
        body: Center(
          child: ElevatedButton(onPressed: (){
            Get.back();
          }, child: Text('LogOut')),
        ));
  }
}
