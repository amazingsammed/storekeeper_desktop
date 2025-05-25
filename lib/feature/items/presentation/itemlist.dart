
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';
import '../../../shared/widgets/datalisting.dart';
import '../controller/itemcontroller.dart';
import 'forms/additem.dart';


class ItemListing extends StatelessWidget {

  ItemListing({super.key});

  final ItemController controller = Get.put(ItemController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return DataTableV2(
          refreshButton: IconButton(icon: Icon(Icons.refresh), onPressed: () async {

            await controller.getAllItems();}).withLoading(controller.loading),
          titleWidget: Row(
            children: [
              PrimaryButton(
                onTap: () async {
                //  await controller.getAllItems();
                   Get.dialog(AddProduct());
                },
                title: "Create New",
              ),
            ],
          ),
          selecteditems: (e) {
            print(e);
          },
          ontap: (element) {
            print(element['id'].runtimeType);
          },
          title: "Items List",
          heads: [
            TableHead(title: 'Name', id: 'name'),
            TableHead(title: 'Group', id: 'group_id'),
            TableHead(title: 'Selling Price', id: 'salesprice',type: TableHeadType.double),
            TableHead(title: 'Status', id: 'status',type: TableHeadType.int),
          ],
          items:controller.allItems.value.map((element){
            return {
              'name': element.name,
              'group_id':element.getGroup(controller.allGroup.value),
              'salesprice':element.salesprice,
              'status': element.getStatus()
            };
          }).toList(),
        );
      }),
    );
  }
}
