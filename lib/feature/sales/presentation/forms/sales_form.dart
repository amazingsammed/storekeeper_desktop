import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/sales/models/salesitem.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

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
          leading: IconButton(icon: Icon(Icons.chevron_left),onPressed: (){
            Get.back();
          },),
          title: Text("Sales Form"),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12
                      ),
                      child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 6),
                              child: Text("no"),
                            ),
                            Expanded(flex: 4, child: Text("Name of Item")),
                            Expanded(flex: 2, child: Text("Quantity")),
                            Expanded(child: Text("Rate")),
                            Expanded(child: Text("Amount")),
                          ]
                      ),
                    ),
                    Obx(() {
                      return Expanded(child: ListView.builder(
                        itemCount: controller.salesItem.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          SalesItem item = controller.salesItem.value[index];
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6),
                                child: Text("${index + 1}"),
                              ),
                              Expanded(flex: 4, child: Text(item.name)),
                              Expanded(flex: 2,
                                  child: Text(item.quantity.toString())),
                              Expanded(child: Text(item.salesprice.toString())),
                              Expanded(child: Text("5000")),
                            ],
                          );
                        },
                      ),
                      );
                    })


                  ],
                ),
              ),
              kSizedbox20,
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
            Text(item.item_name),
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
              onTap: (){
              controller.addSalesItem(SalesItem(name: item.item_name, id: item.item_id, salesprice: item.salesprice, quantity: int.tryParse(qty.text) ??1));
              Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
