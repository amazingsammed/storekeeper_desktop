import 'package:storekepper_desktop/feature/items/domain/models/category.dart';

import 'package:storekepper_desktop/feature/items/domain/models/group.dart';

import 'package:storekepper_desktop/feature/items/domain/models/item.dart';

import 'package:storekepper_desktop/feature/items/domain/models/units.dart';

import 'package:storekepper_desktop/feature/sales/models/voucher.dart';

import '../../../authentication/domain/model/store.dart';
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
  Future<List<CategoryModel>> getAllCategory({required Store store}) {
    // TODO: implement getAllCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Groups>> getAllGroups({required Store store}) {
    // TODO: implement getAllGroups
    throw UnimplementedError();
  }

  @override
  Future<List<Item>> getAllItems({required Store store}) async {
    List<Item> items = [];
    var data =
        await stockItemDB.select().eq('storeid', store.storeid).eq('busid', store.busid);
    for (var element in data) {
      items.add(Item.fromMap(element));
    }
    return items;
  }

  @override
  Future<List<Units>> getAllUnits({required Store store}) {
    // TODO: implement getAllUnits
    throw UnimplementedError();
  }

  @override
  Future<List<Voucher>> getAllVoucher({required Store store}) {
    // TODO: implement getAllVoucher
    throw UnimplementedError();
  }
}
