


import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/ktextfields.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Create New Category"),
        subtitle: Text("Use this form to create a new Category"),
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
                  KTextField(title: "Category Name",id: 'name',),
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