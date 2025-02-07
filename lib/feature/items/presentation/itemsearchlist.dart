

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../domain/models/item.dart';
import '../domain/repository/item_abstract.dart';


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
                  Item item=Item(item_id: 'item_id', purchaseprice: 1.2, item_name: 'item_name', unit_id: 'unit_id', store_id: 'store_id', user_id: 'user_id', created_date: DateTime.now(), image: 'image', is_featured: false, barcode: 'barcode', salesprice: 12, category: 'category', isModified: 0);
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
