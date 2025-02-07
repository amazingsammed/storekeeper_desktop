import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/ktextfields.dart';
import '../../controller/itemcontroller.dart';
import '../../data/local/item_localdb.dart';

class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final ItemController controller = Get.put(ItemController());

  AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Create New Product"),
        subtitle: Text("Use this form to create a new item"),
      ),
      content: FormBuilder(
        key: _formKey,
        child: Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 450,
            width: 600,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      KTextField(
                        title: "Product Name",
                        id: 'name',
                      ),
                      kSizedbox10,
                      Row(
                        children: [
                          Expanded(
                            child: KTextField(
                              title: "Selling price",
                              id: 'salesprice',
                            ),
                          ),
                          kSizedbox10,
                          Expanded(
                            child: KTextField(
                              title: "Purchase price",
                              id: 'purchaseprice',
                            ),
                          ),
                        ],
                      ),
                      kSizedbox10,
                      Row(
                        children: [
                          Expanded(
                              child: KDropDown2(
                            title: 'Group',
                            id: 'group',
                            children: controller.allGroup.value
                                .map((element) => {
                              'name': element.name,
                              'id': element.id
                            })
                                .toList(),
                          )),
                          kSizedbox10,
                          Expanded(
                              child: KDropDown2(
                            title: 'Units',
                            id: 'unit',
                            children: controller.allUnit.value
                                .map((element) => {
                              'name': element.name,
                              'id': element.id
                            })
                                .toList(),
                          )),
                        ],
                      ),
                      CheckboxListTile(
                        value: controller.hasOpeningBal.value,
                        onChanged: (v) {
                          controller.hasOpeningBal.value = v!;
                          controller.update();
                        },
                        title: Text("Has Opening Balanced"),
                      ),
                      if (controller.hasOpeningBal.value)
                        KTextField(
                          title: "Initial Quantity",
                          id: 'qty',
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      onTap: () {
        print(_formKey.currentState?.fields);
                      },
                      title: "Save",
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
