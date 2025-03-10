import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/data/local/sqlite_db.dart';
import 'package:storekepper_desktop/feature/items/domain/models/category.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';
import 'package:storekepper_desktop/feature/items/domain/models/units.dart';

import '../../domain/models/item.dart';
import '../item_database_repository.dart';

class ItemLocalDatabase  implements ItemDatabaseRepository{
  final DatabaseX database = DatabaseX();

  @override
  Future<List<Item>> getAllItems() async {
    List<Item> items = [];
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item');
    var data = lists
        .map((element) =>
            element.map((key, value) => MapEntry(key, value)))
        .toList();
    for (var e in data) {
      items.add(Item.fromMap(e));
    }
    return items;
  }

  @override
  Future<List<Groups>> getAllGroups() async {
    List<Groups> items = [];
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.rawQuery('''
    SELECT
	stock_item_group.name, 
	stock_item_category.name AS category, 
	stock_item_group.status, 
	stock_item_group.id
FROM
	stock_item_category
	INNER JOIN
	stock_item_group
WHERE
	stock_item_category.id = stock_item_group.category
    ''');
    var data = lists
        .map((element) =>
            element.map((key, value) => MapEntry(key, value)))
        .toList();
    for (var e in data) {
      items.add(Groups.fromMap(e));
    }
    print(items);
    return items;
  }

  @override
  Future<List<Units>> getAllUnits() async {
    List<Units> items=[];
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item_unit');
    var data = lists
        .map((element) =>
            element.map((key, value) => MapEntry(key, value)))
        .toList();
    for (var e in data) {
      items.add(Units.fromMap(e));
    }
    print(data);
    return items;
  }

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    List<CategoryModel> items=[];
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists =
        await dbClient!.query('stock_item_category');
    var data = lists
        .map((element) =>
            element.map((key, value) => MapEntry(key, value)))
        .toList();
    for (var e in data) {
      items.add(CategoryModel.fromMap(e));
    }
    return items;
  }

  @override
  Future<bool> addCategory({required Map<String, dynamic> data}) async {
    var dbClient = await database.db;
   int results= await dbClient!.insert('stock_item_category', data);
   if(results==1) return true;
   return false;
  }

  @override
  Future<bool> addGroup({required Map<String, dynamic> data}) async {
    var dbClient = await database.db;
    int results= await dbClient!.insert('stock_item_group', data);
    if(results==1) return true;
    return false;
  }

  @override
  Future<bool> addUnit({required Map<String, dynamic> data}) async {
    var dbClient = await database.db;
    int results= await dbClient!.insert('stock_item_unit', data);
    if(results==1) return true;
    return false;
  }

  @override
  Future<bool> addItem({required Map<String, dynamic> data}) async {
    var dbClient = await database.db;
    int results= await dbClient!.insert('stock_item', data);
    if(results==1) return true;
    return false;
  }
}
