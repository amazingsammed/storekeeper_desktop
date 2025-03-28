import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/business.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/user_business.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/user_store.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/dashboard.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/widgets/textfield.dart';
import '../controller/authcontroller.dart';
import '../domain/model/store.dart';

class StoreSelectionScreen extends StatelessWidget {
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
                      "Store Selection",
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
                      child: authController.userStores.value.isEmpty ? Center(
                        child: Text("Empty"),) :
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: authController.userStores.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserStore item = authController.userStores
                              .value[index];
                          return FutureBuilder(
                              future: authController
                                  .getStoreByID(item.storeid),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  Store item = snapshot.data;
                                  return Card(
                                    child: ListTile(
                                      onTap: (){
                                        authController.selectedStore.value = [item];
                                        Get.toNamed('/dashboard');
                                      },
                                      title: Text(item.name),
                                      subtitle: Text(item.manager),
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
  final TextEditingController manager = TextEditingController();
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
      title: Text("Fill in the Store Information"),
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
              controller: manager,
              focusNode: ownern,
              onFieldSubmitted: (value) {
                locationn.requestFocus();
              },
              icon: Icons.person,
              label: 'Manger',
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
                  name.text = "Busia Head Office";
                  manager.text = "Farouk";
                  location.text = "tafo";
                  contact.text = "0543220177";
                  buttonn.requestFocus();
                },
                icon: Icon(Icons.file_upload)),
            PrimaryButton(focusNode: buttonn, onTap: () async {
              Store business = Store(name: name.text,
                  manager: manager.text,
                  busid: authController.myBusiness.busid,
                  location: location.text,
                  contact: contact.text, storeid: Uuid().v4());
              await authController.saveStore(business);
              Navigator.of(context).pop();
            }, title: "Save")
          ],
        ),
      ),
    );
  }
}
