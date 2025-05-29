 
import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/people/presentation/_component/addcustomer.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/datalisting.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableV2(
      titleWidget: Row(
        children: [
          PrimaryButton (
            onTap: () {
              Get.dialog(AddCustomer());
            },
            title: "Add Customer",
          ),
        ],
      ),
      selecteditems: (e) {
        print(e);
      },
      ontap: (element) {
        print(element['id'].runtimeType);
      },
      title: "Customers",
      heads: [
        TableHead(title: 'Date', id: 'date'),
        TableHead(title: 'Narration', id: 'narration'),
        TableHead(title: 'Account Name', id: 'account_name'),
        TableHead(title: 'Amount', id: 'amount'),
        TableHead(title: "Sales Person", id: 'createdby')
      ],
      items: [],
    );
  }
}
