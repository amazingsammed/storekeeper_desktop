 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// ignore: unused_import
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';
import 'package:storekepper_desktop/feature/people/presentation/_component/addsupplier.dart';

import '../../../shared/widgets/button_c.dart';
import '../../../shared/widgets/datalisting.dart';
import '_component/addcustomer.dart';

class SuppliersPage extends StatelessWidget {
  const SuppliersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableV2(
      titleWidget: Row(
        children: [
          PrimaryButton (
            onTap: () {
              Get.dialog(AddSupplier());
            },
            title: "Add Supplier",
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
