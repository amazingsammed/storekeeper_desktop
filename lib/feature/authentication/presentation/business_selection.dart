import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/business.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/user_business.dart';
import 'package:storekepper_desktop/feature/authentication/presentation/store_selection.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/widgets/textfield.dart';
import '../controller/authcontroller.dart';

class BusinessSelectionScreen extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 600,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.chevron_left)),
                    title: Text(
                      "Business Selection",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: PrimaryButton(
                        onTap: () {
                          Get.dialog(CreateBusiness());
                        },
                        title: 'Create'),
                  ),
                  Divider(),
                  Obx(() {
                    return Container(
                      child: authController.userBusiness.value.isEmpty ? Center(
                        child: Text("Empty"),) :
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: authController.userBusiness.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserBusiness item = authController.userBusiness
                              .value[index];
                          return FutureBuilder(
                              future: authController
                                  .getBusinessByID(item.busid),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  Business item = snapshot.data;
                                  return Card(
                                    
                                    child: ListTile(
                                      onTap: () async {
                                        await authController.getAllStoresbyBusinessID(item.busid);
                                        authController.selectedBusiness.value = [item];
                                        Get.to(()=>StoreSelectionScreen());
                                      },
                                      title: Text(item.name),
                                      subtitle: Text(item.owner),
                                      trailing: Icon(Icons.chevron_right),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              });
                        },
                      ),);
                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateBusiness extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController owner = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController contact = TextEditingController();
  AuthController authController = Get.put(AuthController());
  FocusNode namen = FocusNode();
  FocusNode ownern = FocusNode();
  FocusNode typen = FocusNode();
  FocusNode locationn = FocusNode();
  FocusNode contactn = FocusNode();
  FocusNode buttonn = FocusNode();

  CreateBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Fill in the Business Information"),
      content: Container(
        height: 500,
        width: 400,
        child: ListView(
          children: [
            CustomTextField2(
              controller: name,
              focusNode: namen,
              onFieldSubmitted: (value) {
                ownern.requestFocus();
              },
              icon: Icons.business,
              label: 'Name',
              color: Colors.blue,
              onChanged: (value) {},
            ),
            kSizedbox20,
            CustomTextField2(
              controller: owner,
              focusNode: ownern,
              onFieldSubmitted: (value) {
                typen.requestFocus();
              },
              icon: Icons.person,
              label: 'Owner',
              color: Colors.blue,
              onChanged: (value) {},
            ),
            kSizedbox20,
            CustomTextField2(
              controller: type,
              focusNode: typen,
              onFieldSubmitted: (value) {
                locationn.requestFocus();
              },
              label: 'Description or Type',
              color: Colors.blue,
              onChanged: (value) {},
            ),
            kSizedbox20,
            CustomTextField2(
              controller: location,
              focusNode: locationn,
              onFieldSubmitted: (value) {
                contactn.requestFocus();
              },
              icon: Icons.location_on,
              label: 'Location',
              color: Colors.blue,
              onChanged: (value) {},
            ),
            kSizedbox20,
            CustomTextField2(
              controller: contact,
              focusNode: contactn,
              onFieldSubmitted: (value) {
                buttonn.requestFocus();
              },
              icon: Icons.quick_contacts_dialer,
              label: 'Contact',
              color: Colors.blue,
              onChanged: (value) {},
            ),
            kSizedbox20,
            IconButton(
                onPressed: () {
                  name.text = "Busia Limited";
                  owner.text = "Sammed";
                  type.text = "Phones and Accesories";
                  location.text = "kumasi";
                  contact.text = "0543220177";
                  buttonn.requestFocus();
                },
                icon: Icon(Icons.file_upload)),
            PrimaryButton(focusNode: buttonn, onTap: () async {
              Business business = Business(name: name.text,
                  owner: owner.text,
                  type: type.text,
                  busid: Uuid().v4(),
                  location: location.text,
                  contact: contact.text);
              await authController.saveBusiness(business);
            }, title: "Save")
          ],
        ),
      ),
    );
  }
}
