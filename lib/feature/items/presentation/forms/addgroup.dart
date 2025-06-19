import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/items/controller/itemcontroller.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import '../../../../shared/widgets/ktextfields.dart';

class AddGroup extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final ItemController controller = Get.put(ItemController());
  final bool isEdit;
  final GroupModel? group;
  AddGroup({super.key,  this.isEdit =false, this.group});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title:isEdit?Text("Update Group"): Text("Create New Group"),
        subtitle: Text("Fill the Form below"),
      ),
      content: FormBuilder(
        initialValue: isEdit?{
          "name":group?.name,
          "category":group?.category
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
                                'name': element.name,
                                'id': element.uuid
                              })
                          .toList(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                if(!isEdit)  PrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.fields['name'] == null) {
                        return _formKey.currentState?.fields['name']!
                            .invalidate('Name cannot be empty');
                      }
                      if (_formKey.currentState!.fields['category'] == null) {
                        return _formKey.currentState?.fields['category']!
                            .invalidate('Category is empty');
                      }

                      await controller.addGroup(data: GroupModel(uuid: Uuid().v1(), name: _formKey.currentState!.fields['name']?.value, category: _formKey.currentState!.fields['category']!.value.toString(), createdby: '', storeid: '', is_active: 1, busid: ''));
                      print(_formKey.currentState?.fields.keys);
                      Navigator.of(context).pop();
                    },
                    title: "Save",
                  ),
                if(isEdit)  PrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.fields['name'] == null) {
                        return _formKey.currentState?.fields['name']!
                            .invalidate('Name cannot be empty');
                      }
                      if (_formKey.currentState!.fields['category'] == null) {
                        return _formKey.currentState?.fields['category']!
                            .invalidate('Category is empty');
                      }

                      await controller.updateGroup(data: GroupModel(uuid: group!.uuid, name: _formKey.currentState!.fields['name']?.value, category: _formKey.currentState!.fields['category']!.value.toString(), createdby: '', storeid: '', is_active: 1, busid: ''));
                      Navigator.of(context).pop();
                    },
                    title: "Update",
                  icon: Icons.update,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
