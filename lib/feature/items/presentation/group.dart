
import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addgroup.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';

import '../../../shared/widgets/datalisting.dart';
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
          TableHead(title: 'status', id: 'status'),
        ],
        items: controller.allGroup.value.map((e)=>{
          "name":e.name,
          "category":e.category,
          "status":"Active"
        }).toList(),
      );
    });
  }
}
