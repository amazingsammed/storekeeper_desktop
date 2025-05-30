 
import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';

import '../../../shared/widgets/datalisting.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableV2(
      titleWidget: Row(
        children: [
          ElevatedButton (
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
      title: "Invoice",
      heads: [
        TableHead(title: 'Date', id: 'date'),
        TableHead(title: 'Accountpayable', id: 'narration'),
        TableHead(title: 'Reference', id: 'account_name'),
        TableHead(title: 'Customer', id: 'amount'),
        TableHead(title: "Sales Person", id: 'createdby'),
        TableHead(title: 'Amount', id: 'amount'),
        TableHead(title: 'Status', id: 'amount'),
      ],
      items: [],
    );
  }
}
