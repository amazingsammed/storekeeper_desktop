

import 'package:datatablex/datatablex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/button_c.dart';
import 'package:get/get.dart';

import '../controller/settings_controller.dart';
import '_component/adduser.dart';

class Chartofaccounts extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  Chartofaccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return DataTableX(
              refreshButton: IconButton(onPressed: () async{
                await controller.getChartofAccounts();
              }, icon: Icon(Icons.refresh)),
              title: "Chart of Accounts",
              titleWidget: PrimaryButton(
                title: "Create New Account",
                onTap: (){
                  Get.dialog(AddNewUser());
                },
              ),
              heads: [
                TableHead(title: 'Code', id: 'code',type: TableHeadType.int),
                TableHead(title: "Name", id: "name"),
                TableHead(title: "Group", id: 'group'),
                TableHead(title: "Opening Balance", id: 'opening_bal',type: TableHeadType.int)
              ],
              items: controller.coaList.value);
        }));
  }
}
