

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/ktextfields.dart';
import '../../data/local/itemcontroller.dart';

class AddGroup extends StatelessWidget {
  final ItemDB controller = Get.put(ItemDB());
   AddGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Create New Group"),
        subtitle: Text("Use this form to create a new Group"),
      ),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 450,
        width: 600,
        child: Column(
          children: [
            Expanded(
              child: ListView(

                children: [
                  KTextField(title: "Group Name",id: 'name',),
                  kSizedbox10,
                  KDropDown(title: 'Category',
                    id: 'category',
                    children: controller.allCategory.value.map((element)=>element['name'].toString()).toList(),),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(onTap: (){},title: "Save",)
              ],
            )
          ],
        ),
      ),

    );
  }
}
