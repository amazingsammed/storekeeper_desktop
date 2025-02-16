

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../domain/models/item.dart';
import '../domain/repository/item_repository.dart';


class ItemSearchList extends StatelessWidget {
  final Function(Item) onItemSelect;
  const ItemSearchList({super.key, required this.onItemSelect});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'search',
            decoration: InputDecoration(
              hintText: "Search Item",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),

          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(

                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  Item item =  Item(id: 1, uuid: 'uuid', name: 'name', unitId: 'unit_id', storeid: 'store_id', groupId: 'group_id', createdby: 'created_by', createddate: DateTime.now(),  salesprice: 2, status: 1, isActive: 0, purchaseprice: 22, warninglimit: 1, isService: 1);
                  return ListTile(
                    onTap: ()=>onItemSelect(item),
                    title: Text('data'),subtitle: Text("${344.3}"),);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
