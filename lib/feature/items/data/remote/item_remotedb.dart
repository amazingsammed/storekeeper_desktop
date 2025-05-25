import 'package:sqlbase/sqlbase.dart';
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
  Future<bool> addCategory({required Map<String, dynamic> data}) async {
    var results = await categoryDB.add(data);
    print("$results add cat");
    return true;
  }

  @override
  Future<bool> addGroup({required Map<String, dynamic> data}) async {
    var results = await groupDB.add(data);
    print("$results add group");
    return true;
  }

  @override
  Future<bool> addItem({required Map<String, dynamic> data}) async {
    var results = await stockItemDB.add(data);
    print("$results add item");
    return true;
  }

  @override
  Future<bool> addUnit({required Map<String, dynamic> data}) async {
    var results = await unitDB.add(data);
    print("$results add unit");
    return true;
  }

  @override
  Future<bool> addVoucher({required Map<String, dynamic> data}) async {
    var results = await voucherDB.add(data);
    print("$results add voucher");
    return true;
  }

  @override
  Future<List<CategoryModel>> getAllCategory({required Store store}) async {
    List<CategoryModel> items = [];
    var data =
        await categoryDB.where('storeid',isEqualTo: store.storeid).where('busid', isEqualTo:store.busid).get();
    print(data);
    for (var element in data.data['data']) {
      items.add(CategoryModel.fromMap(element));
    }
    return items;
  }

  @override
  Future<List<Groups>> getAllGroups({required Store store}) async {
    List<Groups> items = [];
    var data =
        await groupDB.where('storeid',isEqualTo: store.storeid).where('busid', isEqualTo:store.busid).get();
    for (var element in data.data['data']) {
      items.add(Groups.fromMap(element));
    }
    return items;
  }

  @override
  Future<List<Item>> getAllItems({required Store store}) async {
    List<Item> items = [];
    var data =
        await stockItemDB.where('storeid', isEqualTo:store.storeid).where('busid', isEqualTo:store.busid).get();
    print(data);
    for (var element in data.data['data']) {
      items.add(Item.fromMap(element));
    }
    return items;
  }

  @override
  Future<List<Units>> getAllUnits({required Store store}) async {
    List<Units> items = [];
    var data =
        await unitDB.where('storeid',isEqualTo: store.storeid).where('busid',isEqualTo: store.busid).get();
    for (var element in data.data['data']) {
      items.add(Units.fromMap(element));
    }
    return items;
  }

  @override
  Future<List<Voucher>> getAllVoucher({required Store store}) async {
    List<Voucher> items = [];
    var data =
        await voucherDB.where('storeid',isEqualTo: store.storeid).where('busid', isEqualTo:store.busid).get();
    for (var element in data.data['data']) {
      items.add(Voucher.fromMap(element));
    }
    return items;
  }
}
