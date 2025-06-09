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

class AddCustomer extends StatefulWidget {
  final bool isEdit;
  final CustomerModel? existingUser;
  const AddCustomer({super.key,  this.isEdit =false, this.existingUser});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _openbalanceController = TextEditingController();


  final PeopleController controller = Get.put(PeopleController());

  final AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.existingUser != null) {
      _nameController.text = widget.existingUser!.name;
      _phoneController.text = widget.existingUser!.phone;
      _addressController.text = widget.existingUser!.address;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _openbalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const ListTile(
        title: Text("Add New Customer"),
        subtitle: Text("Use this form to create a new Customer"),
      ),
      content: Form(
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
                      controller: _nameController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: KTextField(
                            title: "Phone number",
                            id: 'phone',
                            controller: _phoneController,
                          ),
                        ),
                        kSizedbox10,
                        Expanded(
                          child: KTextField(
                            title: "Customer address",
                            id: 'address',
                            controller: _addressController,
                          ),
                        ),
                      ],
                    ),
                    KTextField(
                      title: "Opening balance",
                      id: 'openbal',
                      controller: _openbalanceController,
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
                              name:
                                  _nameController.text,
                              group: "692AC7B4-98AE-4ED5-9D2D-BE8C70D4FBBE",
                              opening_bal: double.parse(_openbalanceController.text??
                                  '0'),
                              description: 'customer',
                              storeid: authController.storeid,
                              createdby: authController.createdby,
                              date: DateTime.now(),
                              status: 1),
                          customer: CustomerModel(
                            name: _nameController.text,
                            coa_uuid: uuid,
                            address: _addressController.text
                                .toString(),
                            phone: _phoneController.text
                                .toString(),
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
