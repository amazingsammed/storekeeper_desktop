import 'dart:convert';

import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/data/local/sqlite_db.dart';

class ItemDB extends GetxController{

  @override
  Future<void> onInit() async {
    await getAllItems();
    await getAllGroups();
    await getAllUnits();
    await getAllCategory();
    super.onInit();
  }
  final DatabaseX database = DatabaseX();

  var allItems = [].obs;
  var allGroup = [].obs;
  var allUnit = [].obs;
  var allCategory = [].obs;



 Future<void> getAllItems() async {
    allItems.clear();
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item');
    var data = lists.map((element)=>element.map((key,value)=>MapEntry(key, value.toString()))).toList();
  allItems.value=data;
  }
  Future<void> getAllGroups() async {
    allGroup.clear();
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item_group');
    var data = lists.map((element)=>element.map((key,value)=>MapEntry(key, value.toString()))).toList();
    allGroup.value=data;
  }
  Future<void> getAllUnits() async {
    allUnit.clear();
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item_unit');
    var data = lists.map((element)=>element.map((key,value)=>MapEntry(key, value.toString()))).toList();
    allUnit.value=data;
  }
  Future<void> getAllCategory() async {
    allCategory.clear();
    var dbClient = await database.db;
    List<Map<String, dynamic>> lists = await dbClient!.query('stock_item_category');
    var data = lists.map((element)=>element.map((key,value)=>MapEntry(key, value.toString()))).toList();
    allCategory.value=data;
  }
  Future<void> addCategory({required Map<String, dynamic> datax}) async {
    var dbClient = await database.db;
     await dbClient!.insert('stock_item_category', datax);
    await getAllCategory();
  }
}