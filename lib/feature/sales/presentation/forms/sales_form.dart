import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/sales/models/salesitem.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/datalisting.dart';
import '../../../items/domain/models/item.dart';

import '../../../items/presentation/itemsearchlist.dart';
import '../../controller/salescontroller.dart';

class SalesForm extends StatelessWidget {
  final SalesController controller = Get.put(SalesController());

  SalesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.chevron_left), onPressed: () {
            Get.back();
          },),
          title: Text("Sales Form"),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                  flex: 4, child: Obx(() {
                return DataTableV2(
                  selecteditems: (e) {
                    print(e);
                  },
                  ontap: (element) {
                    print(element['id'].runtimeType);
                  },
                  title: "Sales List",
                  heads: [
                    TableHead(title: 'Name', id: 'name'),
                    TableHead(title: 'Quantity',
                        id: 'quantity',
                        type: TableHeadType.int),
                    TableHead(title: 'Selling Price',
                        id: 'salesprice',
                        type: TableHeadType.double),
                    TableHead(title: 'Amount',
                        id: 'amount',
                        type: TableHeadType.double),
                  ],
                  items: controller.salesItem.value.map((e) => e.toMap())
                      .toList(),
                );
              })),

              ItemSearchList(onItemSelect: (item) {
                Get.dialog(QuantitySelector(item));
              },),
              kSizedbox5
            ],
          ),
        )
    );
  }
}

class QuantitySelector extends GetView<SalesController> {
  final TextEditingController qty = TextEditingController();

  QuantitySelector(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Number of Quantity")
        ],
      ),
      content: Container(
        height: 300,
        width: 400,
        child: Column(
          children: [
            Text(item.name),
            kSizedbox10,
            FormBuilderTextField(
              controller: qty,
              name: 'quantity',
              decoration: InputDecoration(
                hintText: "Quantity",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            PrimaryButton(
              title: "Save",
              onTap: () {
                controller.addSalesItem(SalesItem(name: item.name,
                    id: item.uuid,
                    salesprice: 1.2,
                    quantity: int.tryParse(qty.text) ?? 1));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
