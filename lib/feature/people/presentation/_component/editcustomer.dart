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

class EditCustomer extends StatelessWidget {
  final CustomerModel customer;
  final _formKey = GlobalKey<FormBuilderState>();
  final PeopleController controller = Get.put(PeopleController());
  final AuthController authController = Get.find();

  EditCustomer({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: ListTile(
        title: Text("Edit Customer"),
        subtitle: Text("Use this form to edit Customer Information"),
        trailing: IconButton(onPressed: (){
          _formKey.currentState?.fields['namex']?.didChange(customer.name);
          _formKey.currentState?.fields['phone']?.didChange(customer.phone);
          _formKey.currentState?.fields['address']?.didChange(customer.address);
        }, icon: Icon(Icons.file_download_done)),
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
                    KTextField(
                      title: "Opening balance",
                      id: 'openbal',
                    ),

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


                      CustomerModel    customerx= CustomerModel(
                            name: _formKey.currentState!.fields['namex']?.value,
                            coa_uuid: customer.coa_uuid,
                            address: _formKey
                                .currentState!.fields['address']!.value
                                .toString(),
                            phone: _formKey.currentState!.fields['phone']!.value
                                .toString(),
                            storeid: authController.storeid,
                            createdby: authController.createdby,
                            status: 1,
                          );

                      await controller.editCustomer(customer: customerx);
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
