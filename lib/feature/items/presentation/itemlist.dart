import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';
import '../controller/itemcontroller.dart';
import 'forms/additem.dart';

class ItemListing extends StatelessWidget {
  ItemListing({super.key});

  final ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return DataTableX(
          refreshButton: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                await controller.getAllItems();
              }).withLoading(controller.loading),
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
          onTap: (element) {},
          title: "Items List",
          heads: [
            TableHead(title: 'Name', id: 'name'),
            TableHead(title: 'Group', id: 'group_id'),
            TableHead(
                title: 'Selling Price',
                id: 'salesprice',
                type: TableHeadType.double),
            TableHead(title: 'Status', id: 'status', type: TableHeadType.int),
            TableHead(
                title: 'Action',
                id: 'id',
                isbutton: true,
                button: (data) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableButton(
                        ontap: () {},
                        icon: Icons.edit,
                        bgColor: Colors.blue,
                      ),
                      TableButton(
                        ontap: () {},
                        bgColor: Colors.red,
                        icon: Icons.delete,
                      ),
                    ],
                  );
                })
          ],
          items: controller.allItems.value.isEmpty
              ? []
              : controller.allItems.value.map((element) {
                  return {
                    'name': element.name,
                    'group_id': element.getGroup(controller.allGroup.value),
                    'salesprice': element.salesprice,
                    'status': element.getStatus()
                  };
                }).toList(),
        );
      }),
    );
  }
}
