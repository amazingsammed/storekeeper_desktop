import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/ktextfields.dart';
import '../../data/local/itemcontroller.dart';

class AddGroup extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final ItemDB controller = Get.put(ItemDB());

  AddGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Create New Group"),
        subtitle: Text("Use this form to create a new Group"),
      ),
      content: FormBuilder(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 450,
          width: 600,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    KTextField(
                      title: "Group Name",
                      id: 'name',
                    ),
                    kSizedbox10,
                    KDropDown2(
                      title: 'Category',
                      id: 'category',
                      children: controller.allCategory.value
                          .map((element) => {
                                'name': element['name'].toString(),
                                'id': element['id']
                              })
                          .toList(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.fields['name'] == null) {
                        return _formKey.currentState?.fields['name']!
                            .invalidate('Name cannot be empty');
                      }
                      if (_formKey.currentState!.fields['category'] == null) {
                        return _formKey.currentState?.fields['category']!
                            .invalidate('Category is empty');
                      }
                      await controller.addGroup(data: {
                        'name': _formKey.currentState!.fields['name']?.value,
                        'category': _formKey.currentState!.fields['category']?.value
                      });
                      print(_formKey.currentState?.fields.keys);
                    },
                    title: "Save",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
