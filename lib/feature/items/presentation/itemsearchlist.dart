

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:storekepper_desktop/feature/items/controller/itemcontroller.dart';

import '../domain/models/item.dart';
import 'package:get/get.dart';


class ItemSearchList extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final ItemController itemController = Get.put(ItemController());
  final Function(Item) onItemSelect;
   ItemSearchList({super.key, required this.onItemSelect});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Scrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    child: ListView.builder(
                  shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: itemController.allItems.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        Item item =  itemController.allItems.value[index];
                        return ListTile(
                          minLeadingWidth: 5,
                          leading: CircleAvatar(child: Text("${index+1}")),
                          onTap: ()=>onItemSelect(item),
                          title: Text(item.name),subtitle: Text("\$${item.salesprice}"),);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
