
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../shared/constant/colors.dart';
import '../../../../shared/widgets/button_c.dart';
import '../../../../shared/widgets/textfield.dart';
import '../../../authentication/domain/model/profile.dart';

class AddNewUser extends GetView {
  final TextEditingController othername = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController fthname = TextEditingController();
  final TextEditingController mthname = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController gender = TextEditingController();

  bool isEdit;
  Profile? student;
  final _key = GlobalKey<FormState>();

  // RxBool isActive = false.obs;




  AddNewUser({Key? key, this.isEdit = false, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (isEdit) {

    }

    return AlertDialog(
      title: Container(
        height: 40,
        child: Row(
          children: [
            Row(
              children: [
                isEdit
                    ? const Text(
                  'Edit User',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
                    : const Text(
                  'Register New User',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            if (!isEdit)
              SecondaryButtons(
                icon: Icons.clear_all,
                title: 'Clear All',
                onTap: () {

                },
              ),
            if (!isEdit)
              SizedBox(
                width: 15,
              ),
            if (!isEdit)
              PrimaryButton(
                icon: Icons.add,
                title: 'Save',
                onTap: () async {
                  if (_key.currentState!.validate()) {}
                },
              ),
            if (isEdit)
              PrimaryButton(
                icon: Icons.add,
                title: 'Update',
                onTap: () async {
                  if (_key.currentState!.validate()) {}
                },
              ),
          ],
        ),
      ),
      content: Container(
        padding: EdgeInsets.all(15),
        height: 600,
        width: 600,
        child: Form(
          key: _key,
          child: ListView(
            children: [

              kSizedbox10,
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldNonEmpty(
                      label: 'First Name',
                      color: Colors.blue,
                      controller: firstname,
                      onChanged: (String value) {},
                    ),
                  ),

                  kSizedbox10,
                  Expanded(
                    child: CustomTextFieldNonEmpty(
                      label: 'Last Name',
                      color: Colors.blue,
                      controller: lastname,
                      onChanged: (String value) {},
                    ),
                  ),
                  kSizedbox10,
                  Expanded(
                    child: CustomTextField2(
                      label: 'Othername',
                      color: Colors.blue,
                      controller: othername,
                      onChanged: (String value) {},
                    ),
                  ),
                ],
              ),
              kSizedbox10,
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldNonEmpty(
                      label: 'Email',
                      color: Colors.blue,
                      controller: email,
                      onChanged: (String value) {},
                    ),
                  ),

                  kSizedbox10,
                  Expanded(
                    child: CustomTextFieldPhone(
                      label: 'Contact',
                      color: Colors.blue,
                      controller: contact,
                      onChanged: (String value) {},
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}