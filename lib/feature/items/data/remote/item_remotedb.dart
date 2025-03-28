import 'package:storekepper_desktop/feature/items/domain/models/category.dart';

import 'package:storekepper_desktop/feature/items/domain/models/group.dart';

import 'package:storekepper_desktop/feature/items/domain/models/item.dart';

import 'package:storekepper_desktop/feature/items/domain/models/units.dart';

import 'package:storekepper_desktop/feature/sales/models/voucher.dart';

import '../../../supabase_db.dart';
import '../local_database_repository.dart';

class ItemRemoteDatabase implements ItemDatabaseRepository {
  @override
  Future<bool> addCategory({required Map<String, dynamic> data}) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<bool> addGroup({required Map<String, dynamic> data}) {
    // TODO: implement addGroup
    throw UnimplementedError();
  }

  @override
  Future<bool> addItem({required Map<String, dynamic> data}) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<bool> addUnit({required Map<String, dynamic> data}) {
    // TODO: implement addUnit
    throw UnimplementedError();
  }

  @override
  Future<bool> addVoucher({required Map<String, dynamic> data}) {
    // TODO: implement addVoucher
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> getAllCategory() {
    // TODO: implement getAllCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Groups>> getAllGroups() {
    // TODO: implement getAllGroups
    throw UnimplementedError();
  }

  @override
  Future<List<Item>> getAllItems({String? storeid,String? busid}) async {
    List<Item> items = [];
    print(storeid);
    print(busid);
    var data =
        await stockItemDB.select().eq('storeid', storeid.toString()).eq('busid', busid.toString());
    for (var element in data) {
      items.add(Item.fromMap(element));
    }
    return items;
  }

  @override
  Future<List<Units>> getAllUnits() {
    // TODO: implement getAllUnits
    throw UnimplementedError();
  }

  @override
  Future<List<Voucher>> getAllVoucher() {
    // TODO: implement getAllVoucher
    throw UnimplementedError();
  }
}
