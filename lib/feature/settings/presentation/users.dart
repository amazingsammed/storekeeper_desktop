

import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/settings/presentation/settings.dart';

import '../../../shared/widgets/button_c.dart';
import '../../authentication/controller/authcontroller.dart';
import '_component/adduser.dart';

class UsersTable extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return DataTableX(
              refreshButton: IconButton(onPressed: () async{
               await authController.getUsersInStore();
              }, icon: Icon(Icons.refresh)),
              title: "User Management",
              titleWidget: PrimaryButton(
                title: "Add New User",
                onTap: (){
                  Get.dialog(AddNewUser());
                },
              ),
              heads: [
                TableHead(title: 'Name', id: 'name'),
                TableHead(title: "Role", id: "role"),
                TableHead(title: "Email", id: 'email'),
                TableHead(title: "Status", id: 'status',type: TableHeadType.int)
              ],
              items: authController.storemembers.value);
        }));
  }
}
