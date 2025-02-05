import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';

import '../../../shared/widgets/datalisting.dart';

class PurchaseOrder extends StatelessWidget {
  const PurchaseOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainPageWithToolBar(
      toolBar: PurchasesToolBar(),
      child: DataTableV2(
        titleWidget: Row(
          children: [
            Button(
              onPressed: () {},
              child: Text("Create New"),
            ),
          ],
        ),
        selecteditems: (e) {
          print(e);
        },
        ontap: (element) {
          print(element['id'].runtimeType);
        },
        title: "Purchase Order",
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
