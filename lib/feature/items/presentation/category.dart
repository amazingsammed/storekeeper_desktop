
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addcategory.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';

import '../../../shared/widgets/datalisting.dart';
import '../controller/itemcontroller.dart';

class CategoryPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DataTableV2(
        refreshButton: IconButton(icon: Icon(Icons.refresh), onPressed: () async { await controller.getAllCategory();}).withLoading(controller.loading),
        titleWidget: Row(
          children: [
            PrimaryButton(
              onTap: () {
                Get.dialog(AddCategory());
              },
              title: "Create New",
            ),
          ],
        ),
        selecteditems: (e) {
        },
        ontap: (element) {
        },
        title: "Category of Item",
        heads: [
          TableHead(title: 'Name', id: 'name'),
          TableHead(title: 'Status', id: 'status'),
        ],
        items: controller.allCategory.value.map((e)=>{
          "name":e.name,
          "status":"Active"
        }).toList(),
      );
    });
  }
}
