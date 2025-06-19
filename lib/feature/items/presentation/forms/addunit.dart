

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/items/domain/models/units.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/widgets/ktextfields.dart';
import '../../controller/itemcontroller.dart';

class AddUnit extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());
  final _formKey = GlobalKey<FormBuilderState>();
  final bool isEdit;
  final UnitModel? unit;
   AddUnit({super.key, this.isEdit = false, this.unit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: isEdit?Text("Update Unit"):Text("Create New Unit"),
        subtitle: Text("Fill the form below"),
      ),
      content: FormBuilder(
        initialValue: isEdit?{
          "name":unit?.name
        }:{},
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

                    await controller.addUnit(data: UnitModel(uuid: Uuid().v1(), name: _formKey.currentState?.fields['name']!.value, status: 1, storeid: '', busid: '', createdby: ''));

                    Navigator.of(context).pop();
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
