import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/user_store.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/dashboard.dart';
import 'package:storekepper_desktop/feature/items/controller/itemcontroller.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/extensions/buttons.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/widgets/textfield.dart';
import '../businessinfo.dart';
import '../controller/authcontroller.dart';
import '../domain/model/store.dart';

class StoreSelectionScreen extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 700,
          width: 700,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedbox20,
                  ListTile(
                    title: const Text(
                      "Store Selection",
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: const Text(
                      "List of stores under the business",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryButton(
                            color: Colors.black,
                            icon: Icons.arrow_back_ios_new,
                            onTap: () {
                              authController.loading.value == false;
                              Get.back();
                            },
                            title: 'Back'),
                        kSizedbox20,
                        PrimaryButton(
                            onTap: () {
                              Get.dialog(CreateStore());
                            },
                            title: 'Create'),
                      ],
                    ),
                  ),

                  const Divider(),
                  kSizedbox20,
                  Expanded(
                    child: Obx(() {
                      if(authController.userStores.isEmpty)return const Center(child: Text('data'),);
                      return ListView.builder(

                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: authController.userStores.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserStore item =
                          authController.userStores.value[index];
                          return FutureBuilder(
                              future: authController
                                  .getStoreByID(item.storeid),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  Store item = snapshot.data;
                                  return Card(
                                    child: ListTile(
                                      onTap: () async {
                                        authController
                                            .selectedStoreList.clear();
                                        authController
                                            .selectedStoreList.add(item);
                                        await itemController.startup();
                                        Get.to(() => MainDashboard());
                                      },
                                      title: Text(item.name),
                                      subtitle: Text(item.manager),
                                      trailing: const Icon(Icons.chevron_right),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const Icon(Icons.error_outline);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              });
                        },
                      );
                    }),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateStore extends StatelessWidget {
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

  CreateStore({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Fill in the Store Information"),
      content: SizedBox(
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
                icon: const Icon(Icons.file_upload)),
            PrimaryButton(
                focusNode: buttonn,
                onTap: () async {
                  try {
                    authController.loading.value = true;
                    Store business = Store(
                        name: name.text,
                        manager: manager.text,
                        busid: appbusiness.busid,
                        location: location.text,
                        contact: contact.text,
                        createdby: authController.currentProfile.value.userid,
                        storeid: const Uuid().v4());
                    await authController.saveStore(business);
                  } catch (e) {
                    print(e);
                  } finally {
                    authController.loading.value = false;
                    Navigator.of(context).pop();
                  }
                },
                title: "Save")
                .withLoading(loading: authController.loading)
          ],
        ),
      ),
    );
  }
}
