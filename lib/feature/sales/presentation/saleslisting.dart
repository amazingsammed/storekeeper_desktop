import 'package:datatablex/datatablex.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/sales/presentation/forms/sales_form.dart';
import 'package:storekepper_desktop/shared/extensions/strings.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:storekepper_desktop/shared/widgets/button_extension.dart';
import 'package:storekepper_desktop/shared/widgets/datetimex.dart';

import '../controller/salescontroller.dart';


class Saleslisting extends GetView<SalesController> {
  @override
  final controller = Get.put(SalesController());

  Saleslisting({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Obx(() {
        return DataTableX(
          refreshButton: IconButton(
              icon: const Icon(Icons.refresh), onPressed: () async {
            await controller.getAllSales();
          }).withLoading(false.obs),
          titleWidget: Row(
            children: [
              PrimaryButton(
                onTap: () {
                  Get.to(() => SalesForm(), fullscreenDialog: true);
                },
                title: "Create New",
              ),
            ],
          ),
          // selecteditems: (e) {
          //   print(e);
          // },
          ontap: (element) {
            print(element['id'].runtimeType);
          },
          title: "Sales Listing",

          heads: [
            TableHead(title: 'Date', id: 'date'),
            TableHead(title: 'Narration', id: 'narration'),
            TableHead(title: 'Account Name', id: 'account_name'),
            TableHead(title: 'Amount', id: 'amount'),
            TableHead(title: "Sales Person", id: 'createdby')
          ],
          items: controller.salesList.value.isEmpty ? [] : controller.salesList
              .value.map((element) {
            return {
              'account_name': element.party_name,
              'narration': element.narration,
              'date': element.date.mdy,
              'amount': element.amount.toString(),
              'createdby': element.createdby
            };
          }).toList(),
        );
      });
  }
}


