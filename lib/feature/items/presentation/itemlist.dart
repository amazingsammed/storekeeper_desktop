
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';
import 'package:storekepper_desktop/feature/items/domain/models/item.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';
import '../../../shared/widgets/datalisting.dart';
import '../controller/itemcontroller.dart';
import '../data/local/item_localdb.dart';
import 'forms/additem.dart';


class ItemListing extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  ItemListing({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPageWithToolBar(
      toolBar: ItemToolBar(),
      child: Obx(() {
        return DataTableV2(
          refreshButton: IconButton(icon: Icon(Icons.refresh), onPressed: () async { await controller.getAllItems();}).withLoading(controller.loading),
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
          items:itemToMap(controller.allItems.value),
        );
      }),
    );
  }
}
