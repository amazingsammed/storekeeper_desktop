

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/ktextfields.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Create New Product"),
        subtitle: Text("Use this form to create a new item"),
      ),
      content: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 450,
          width: 600,
          child: Column(
            children: [
              Expanded(
                child: ListView(

                  children: [
                    KTextField(title: "Product Name",id: 'name',),
                    kSizedbox10,
                    Row(
                      children: [
                        Expanded(
                          child: KTextField(title: "Selling price",id: 'sprice',),
                        ),
                        kSizedbox10,
                        Expanded(
                          child: KTextField(title: "Purchase price",id: 'pprice',),
                        ),
                      ],
                    ),
                    kSizedbox10,
                    Row(children: [
                      Expanded(child: KDropDown(title: 'Group',
                      id: 'group',
                      children: [
                        "phone","others","cosmetics"
                      ],)),
                      kSizedbox10,
                      Expanded(child: KDropDown(title: 'Units',
                        id: 'unit',
                        children: [
                          "box","pack","kilo"
                        ],)),
                    ],),
                  ],
                ),
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PrimaryButton(onTap: (){},title: "Save",)
                      ],
                    )
            ],
          ),
        ),

    );
  }
}
