import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/people/controller/peoplecontroller.dart';
import 'package:storekepper_desktop/feature/people/models/chatofaccounts.dart';
import 'package:storekepper_desktop/feature/people/models/customer_model.dart';
import 'package:storekepper_desktop/feature/people/models/customer_record.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/constant/colors.dart';
import '../../../../shared/widgets/ktextfields.dart';

class AddCustomer extends StatelessWidget {
  final bool isEdit;
  final CustomerModel? customer;

  AddCustomer({super.key, this.isEdit = false, this.customer});

  final _formKey = GlobalKey<FormBuilderState>();

  final PeopleController controller = Get.put(PeopleController());

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  ListTile(
        title: isEdit?Text("Update Customer"):Text("Add New Customer"),
        subtitle: Text("Use this form to create a new Customer"),
      ),
      content: FormBuilder(
        initialValue: isEdit?{
          'namex': customer?.name,
          'phone': customer?.phone,
          'address': customer?.address
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
                      title: "Customer Name",
                      id: 'namex',

                    ),
                    Row(
                      children: [
                        Expanded(
                          child: KTextField(
                            title: "Phone number",
                            id: 'phone',

                          ),
                        ),
                        kSizedbox10,
                        Expanded(
                          child: KTextField(
                            title: "Customer address",
                            id: 'address',

                          ),
                        ),
                      ],
                    ),
                   if(!isEdit) KTextField(
                      title: "Opening balance",
                      id: 'openbal',

                    ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) return;
                      String uuid = const Uuid().v4();
                      CustomerRecord accounts = CustomerRecord(
                          accounts: ChatofAccounts(
                              uuid: uuid,
                              code: 4566,
                              name: _formKey.currentState!.fields['name']?.value,
                              group: "692AC7B4-98AE-4ED5-9D2D-BE8C70D4FBBE",
                              opening_bal: double.parse(
                                  _formKey.currentState!.fields['openbal']?.value ?? '0'),
                              description: 'customer',
                              storeid: authController.storeid,
                              createdby: authController.createdby,
                              date: DateTime.now(),
                              status: 1),
                          customer: CustomerModel(
                            name: _formKey.currentState!.fields['name']?.value,
                            coa_uuid: uuid,
                            address: _formKey.currentState!.fields['address']?.value,
                            phone: _formKey.currentState!.fields['phone']?.value,
                            storeid: authController.storeid,
                            createdby: authController.createdby,
                            status: 1,
                          ));

                      await controller.addCustomer(transaction: accounts);
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
