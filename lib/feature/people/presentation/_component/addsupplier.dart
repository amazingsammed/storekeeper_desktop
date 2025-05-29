import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/people/controller/peoplecontroller.dart';
import 'package:storekepper_desktop/feature/people/models/customer_model.dart';
import 'package:storekepper_desktop/feature/people/models/supplier_model.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import '../../../../shared/constant/colors.dart';
import '../../../../shared/widgets/ktextfields.dart';

class AddSupplier extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final PeopleController controller = Get.put(PeopleController());

  AddSupplier({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text("Add New Supplier"),
        subtitle: Text("Use this form to create a new Supplier"),
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
                      title: "Supplier Name",
                      id: 'name',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: KTextField(
                            title: "Supplier number",
                            id: 'name',
                          ),
                        ),
                        kSizedbox10,
                        Expanded(
                          child: KTextField(
                            title: "Supplier address",
                            id: 'name',
                          ),
                        ),
                      ],
                    )

                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: KDropDown2(
                    //           title: 'Customer Type',
                    //           id: 'type',
                    //           children: controller.CustomerType.value,
                    //         )),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    onTap: () async {
                      SupplierModel item = SupplierModel(
                        name: _formKey.currentState!.fields['name']?.value,
                        coa_uuid: 'idsdf',
                        address: _formKey.currentState!.fields['address']!.value
                            .toString(),
                        phone: _formKey.currentState!.fields['phone']!.value
                            .toString(),
                        createdby: 'createdby',
                        storeid: 'storeid',
                        status: 1,
                      );
                      await controller.addSupplier(data: item);
                      Navigator.of(context).pop();
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
