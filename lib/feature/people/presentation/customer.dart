import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/people/controller/peoplecontroller.dart';
import 'package:storekepper_desktop/feature/people/models/customer_model.dart';
import 'package:storekepper_desktop/feature/people/presentation/_component/addcustomer.dart';
import 'package:storekepper_desktop/feature/people/presentation/_component/editcustomer.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';
import 'package:storekepper_desktop/shared/widgets/dialogpreview.dart';

class CustomerPage extends StatelessWidget {
  final PeopleController controller = Get.put(PeopleController());

  CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DataTableX(
        refreshButton: IconButton(
            icon: Icon(Icons.refresh), onPressed: () async {
          await controller.getAllCutomers();
        }).withLoading(controller.loading),
        titleWidget: Row(
          children: [
            PrimaryButton(
              onTap: () {
                Get.dialog(AddCustomer());
              },
              title: "Add Customer",
            ),
          ],
        ),
        onTap: (element) {
         Get.dialog(Dialogpreview(
             title: 'Customer Full Information',
             data: element));
        },
        title: "Customers",
        heads: [
          TableHead(title: 'Name', id: 'name'),
          TableHead(title: 'Phone', id: 'phone'),
          TableHead(title: 'Address', id: 'address'),
          TableHead(title: 'Amount owning', id: 'amount'),
          TableHead(title: 'Action', id: 'id',isbutton: true,button: (data){
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableButton(
                  ontap: (){
Get.dialog(EditCustomer(customer: CustomerModel.fromMap(data)));
                  },
                  icon: Icons.edit, bgColor: Colors.blue,
                ),TableButton(
                  ontap: (){

                  },
                  bgColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            );
          })
        ],
        items: controller.customerList.value.map((e) => e.toMap()).toList(),
      );
    });
  }
}
