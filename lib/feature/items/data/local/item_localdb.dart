import 'package:storekepper_desktop/feature/sqlite_db.dart';
import 'package:storekepper_desktop/feature/items/domain/models/category.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';
import 'package:storekepper_desktop/feature/items/domain/models/units.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';

import '../../../authentication/domain/model/store.dart';
import '../../domain/models/item.dart';
import '../local_database_repository.dart';

class ItemLocalDatabase  implements ItemDatabaseRepository{
  final DatabaseX database = DatabaseX();

  @override
  Future<List<Item>> getAllItems({required Store store}) async {
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
  Future<List<GroupModel>> getAllGroups({required Store store}) async {
    List<GroupModel> items = [];
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
      items.add(GroupModel.fromMap(e));
    }
    return items;
  }

  @override
  Future<List<UnitModel>> getAllUnits({required Store store}) async {
    List<UnitModel> items=[];
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item_unit');
    var data = lists
        .map((element) =>
            element.map((key, value) => MapEntry(key, value)))
        .toList();
    for (var e in data) {
      items.add(UnitModel.fromMap(e));
    }
    return items;
  }

  @override
  Future<List<CategoryModel>> getAllCategory({required Store store}) async {
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

  @override
  Future<bool> addVoucher({required Map<String, dynamic> data}) async {
    var dbClient = await database.db;
    int results= await dbClient!.insert('voucher', data);
    if(results==1) return true;
    return false;
  }

  @override
  Future<List<Voucher>> getAllVoucher({required Store store}) async {
    List<Voucher> items=[];
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item_unit');
    var data = lists
        .map((element) =>
        element.map((key, value) => MapEntry(key, value)))
        .toList();
    for (var e in data) {
      items.add(Voucher.fromMap(e));
    }
    return items;
  }
}
