 
import 'package:flutter/material.dart';

import '../../../shared/widgets/datalisting.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

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
      title: "Quote",
      heads: [
        TableHead(title: 'Date', id: 'date'),
        TableHead(title: 'Quote', id: 'narration'),
        TableHead(title: 'Customer', id: 'account_name'),
        TableHead(title: "Sales Person", id: 'createdby'),
        TableHead(title: 'Status', id: 'amount'),
        TableHead(title: 'Amount', id: 'amount'),
      ],
      items: [],
    );
  }
}
