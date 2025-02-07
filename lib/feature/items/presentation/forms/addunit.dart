

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../../shared/widgets/ktextfields.dart';
import '../../data/local/item_localdb.dart';

class AddUnit extends StatelessWidget {
  final ItemLocalDatabase controller = Get.put(ItemLocalDatabase());
  final _formKey = GlobalKey<FormBuilderState>();
   AddUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Create New Unit"),
        subtitle: Text("Use this form to create a new unit"),
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
                    KTextField(title: "Unit Name",id: 'name',),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(onTap: () async {
                    //_formKey.currentState?.fields['name']!.invalidate('Email already taken');
                    if (_formKey.currentState!.fields['name']!.value == '') {
                      return _formKey.currentState?.fields['name']!
                          .invalidate('Category is empty');
                    }
                    await controller.addUnit(data: {
                      "name": _formKey.currentState?.fields['name']!.value,
                      'status': 1
                    });
                  },title: "Save",)
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
