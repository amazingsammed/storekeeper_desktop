import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../shared/constant/colors.dart';
import '../../../shared/widgets/textfield.dart';
import '../../authentication/domain/model/profile.dart';

class MySettingsPage extends StatefulWidget {
  MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          bottom: TabBar(
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.black,
              dividerColor: Colors.black12,
              controller: controller,
              isScrollable: true,
              tabs: [
                Tab(
                  text: "General",
                ),
                Tab(
                  text: "User",
                ),
                Tab(
                  text: "About",
                ),
              ]),
        ),
        body: TabBarView(
            controller: controller,
            children: [GeneralPage(), UserPage(), AboutPage()]));
  }
}

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('LogOut')),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          return DataTableX(
              refreshButton: IconButton(onPressed: () {
                authController.getUsersInStore();
              }, icon: Icon(Icons.refresh)),
              title: "User Management",
              titleWidget: PrimaryButton(
                title: "Add New User",
                onTap: (){
                  Get.dialog(AddNewUser());
                },
              ),
              heads: [
                TableHead(title: 'Name', id: 'username'),
                TableHead(title: "Phone", id: "contact"),
                TableHead(title: "Email", id: 'email'),
                TableHead(title: "Type", id: 'type')
              ],
              items: authController.storemembers.value);
        }));
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Container());
  }
}

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
