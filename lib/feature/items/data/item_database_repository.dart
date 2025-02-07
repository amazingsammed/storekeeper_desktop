

import '../domain/models/category.dart';
import '../domain/models/group.dart';
import '../domain/models/item.dart';
import '../domain/models/units.dart';

abstract class ItemDatabaseRepository{
  Future<List<Item>> getAllItems() ;

  Future<List<Groups>> getAllGroups();

  Future<List<Units>> getAllUnits();

  Future<List<CategoryModel>> getAllCategory();

  Future<bool> addCategory({required Map<String, dynamic> data});

  Future<bool> addGroup({required Map<String, dynamic> data});

  Future<bool> addUnit({required Map<String, dynamic> data}) ;
  Future<bool> addItem({required Map<String, dynamic> data}) ;
}