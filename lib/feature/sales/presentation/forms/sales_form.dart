import 'package:flutter/cupertino.dart';
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
                  titleWidget: Row(
                    children: [
                      SecondaryButtons(
                        onTap: (){
                          controller.salesItem.value =[];
                        },
                        title: "Clear All",
                        icon: Icons.clear_all,
                      ),
                      kSizedbox10,
                      PrimaryButton(
                        onTap: () {
                          Get.dialog(CreateSale());
                        },
                        title: "Create Sales",
                      ),
                    ],
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name),
            kSizedbox5,
            Text(item.salesprice.toString()),
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
            kSizedbox10,
            PrimaryButton(
              title: "Save",
              onTap: () {
                controller.addSalesItem(SalesItem(name: item.name,
                    id: item.uuid,
                    salesprice: item.salesprice,
                    quantity: int.tryParse(qty.text) ?? 1, uuid: item.uuid));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class CreateSale extends GetView<SalesController> {
  final TextEditingController qty = TextEditingController();

  CreateSale({super.key});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        leading: Icon(CupertinoIcons.cart),
        title: Text("Create Sales"),
subtitle: Text("Used to save a transaction"),
      ),
      content: Container(
        height: 300,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              subtitle: Text("Total Number of Items"),
title: Text("Total Cost of item"),
            ),
            kSizedbox10,
            FormBuilderTextField(
              controller: qty,
              name: 'amount',
              decoration: InputDecoration(
                hintText: "Amount Paid by Customer",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            kSizedbox10,
            ListTile(
              title: Text("Balance to give Customer"),
              subtitle: Text(" 2000 - 1900"),
              trailing: Text("100"),

            ),
            kSizedbox10,
            PrimaryButton(
              title: "Save",
              onTap: () {
              },
            )
          ],
        ),
      ),
    );
  }
}
