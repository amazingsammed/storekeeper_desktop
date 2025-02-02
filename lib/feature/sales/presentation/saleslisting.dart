import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/sales/presentation/forms/sales_form.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../shared/widgets/datalisting.dart';
import '../../dashboard/presentation/_component/toolbarItem.dart';

class Saleslisting extends StatelessWidget {
  const Saleslisting({super.key});

  @override
  Widget build(BuildContext context) {
    return
        MainPageWithToolBar(
          toolBar: SalesToolBar(),
          child: DataTableV2(

              titleWidget: Row(
                children: [
                  PrimaryButton(
                    onTap: () {
                      Get.to(()=>SalesForm(),fullscreenDialog: true);

                    },
                    title: "Create New",
                  ),
                ],
              ),
              selecteditems: (e) {
                print(e);
              },
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
              items: [],
            ),
        );

  }
}


