
import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/domain/models/category.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addcategory.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';

import '../controller/itemcontroller.dart';

class CategoryPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DataTableX(
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

        onTap: (element) {
        },
        title: "Category of Item",
        heads: [
          TableHead(title: 'Name', id: 'name'),
          TableHead(title: 'Status', id: 'status'),TableHead(title: 'Action', id: 'id',isbutton: true,button: (data){
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableButton(
                  ontap: (){
                    Get.dialog(AddCategory(isEdit: true,categoryModel: CategoryModel.fromMap(data['data']),));
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
        items: controller.allCategory.value.map((e)=>{
          "name":e.name,
          "status":"Active",
          "data":e.toMap()
        }).toList(),
      );
    });
  }
}
