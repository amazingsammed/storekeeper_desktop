
import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addgroup.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';

import '../controller/itemcontroller.dart';

class GroupPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DataTableX(
        refreshButton: IconButton(icon: Icon(Icons.refresh), onPressed: () async { await controller.getAllGroups();}).withLoading(controller.loading),
        titleWidget: Row(
          children: [
            PrimaryButton(
              onTap: () {
                Get.dialog(AddGroup());
              },
              title: "Create New",
            ),
          ],
        ),

        onTap: (element) {
          print(element['id'].runtimeType);
        },
        title: "Item Grouping",
        heads: [
          // TableHead(title: 'Date', id: 'date'),
          TableHead(title: 'Name', id: 'name'),
          TableHead(title: 'Category', id: 'category'),
          TableHead(title: 'status', id: 'status'),TableHead(title: 'Action', id: 'id',isbutton: true,button: (data){
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableButton(
                  ontap: (){
                    Get.dialog(AddGroup(isEdit: true,group: GroupModel.fromMap(data['data']),));

                  },
                  icon: Icons.edit, bgColor: Colors.blue,
                ),TableButton(
                  ontap: (){

                  },
                  bgColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            );
          })
        ],
        items: controller.allGroup.value.map((e)=>{
          "name":e.name,
          "category":e.category,
          "status":"Active","data":e.toMap()
        }).toList(),
      );
    });
  }
}
