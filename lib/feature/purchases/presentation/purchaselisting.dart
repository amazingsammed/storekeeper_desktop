 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../shared/widgets/button_c.dart';
import '../../../shared/widgets/datalisting.dart';
import 'forms/purchases_form.dart';

class PurchaseListing extends StatelessWidget {
  const PurchaseListing({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableV2(
      titleWidget: Row(
        children: [
          PrimaryButton (
            onTap: () {
              Get.dialog(PurchasesForm());
            },
            title: "Create Purchases",
          ),

        ],
      ),
      selecteditems: (e) {
      },
      ontap: (element) {
      },
      title: "Purchase Listing",
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
