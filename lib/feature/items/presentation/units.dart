
import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addunit.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';

import '../../../shared/widgets/button_c.dart';
import '../../../shared/widgets/datalisting.dart';
import '../controller/itemcontroller.dart';
import '../domain/models/units.dart';

class UnitsPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DataTableX(
        refreshButton: IconButton(icon: Icon(Icons.refresh), onPressed: () async { await controller.getAllUnits();}).withLoading(controller.loading),
        titleWidget: Row(
          children: [
            PrimaryButton(
              onTap: () {
                Get.dialog(AddUnit());
              },
              title: "Create New",
            ),
          ],
        ),

        onTap: (element) {
          print(element['id'].runtimeType);
        },
        title: "Units",
        heads: [
          TableHead(title: 'Name', id: 'name'),
          TableHead(title: 'Status', id: 'status'),
          TableHead(title: 'Action', id: 'id',isbutton: true,button: (data){
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableButton(
                  ontap: (){
                    Get.dialog(AddUnit(isEdit: true,unit: UnitModel.fromMap(data['data']),));
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
        items: controller.allUnit.value.map((e) =>
        {
          "name": e.name,
          "status": "Active",
          "data":e.toMap()
        }).toList(),
      );
    });
  }
}
